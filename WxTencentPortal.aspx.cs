using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NDS.Kits;
using NDS.Widgets.Weixin;
using NDS.Kits.IO;
using NDS.Kits.Cxx;

namespace OTMS
{
    public partial class WxTencentPortal : System.Web.UI.Page
    {
        protected void Page_Load( object sender, EventArgs e )
        {
            if ( !Config.Instance.IsInitialized )
            {
                Config.Instance.Load();
            }

            if ( WxNormalHandler.IsVerifyingSignature() )
            {
                //首次接入校验Signature
                WxNormalHandler.VerifySignature();
            }
            else
            {
                byte[] bReq = Request.BinaryRead( Request.TotalBytes );
                if ( bReq.Length > 0 )
                {
                    string sReq = Encoding.UTF8.GetString( bReq );
                    if ( sReq.Length > 0 )
                    {
                        if ( WxNormalHandler.IsRcvTecentMsg( ref sReq ) )
                        {
                            //收到消息
                            WxMsgHandler hMsg = new WxMsgHandler();
                            if ( hMsg.Parse( sReq ) )
                            {
                                if ( hMsg.MsgType == WxMsgType.Text )
                                {
                                    hMsg.TextMsg2Db( hMsg.FromUser, hMsg.MsgId, hMsg.MsgType, hMsg.Content );

                                    //响应消息处理
                                    TextMsgResponse( Config.Instance.Wx.Response, ref hMsg );
                                }
                                else
                                {
                                    Response.Write( "success" );
                                }
                            }
                            else
                            {
                                Response.Write( "success" );
                            }
                        }
                        else if ( WxNormalHandler.IsRcvTecentEvent( ref sReq ) )
                        {
                            //收到事件
                            WxEventHandler hEvt = new WxEventHandler();
                            if ( hEvt.Parse( sReq ) )
                            {
                                if ( hEvt.Event == WxEventType.Subscribe )
                                {
                                    //关注，执行数据库注册操作
                                    if ( hEvt.Subscribe( hEvt.FromUser ) )
                                    {
                                        string _Welcome = Config.Instance.Wx.Welcome;
                                        _Welcome = _Welcome.Replace( "{{$date}}", zDate.Format( DateTime.Now, DateFormatStyle.Style( true, false, false, true ) ) );
                                        _Welcome = _Welcome.Replace( "{{$name}}", Config.Instance.Wx.Name );

                                        SubscribeResponse( _Welcome, ref hEvt );
                                    }
                                }
                                else if ( hEvt.Event == WxEventType.Unsubscribe )
                                {
                                    //取消关注
                                    hEvt.Unsubscribe( hEvt.FromUser );
                                }
                            }
                        }
                    }
                }

                //其他情况直接返回
                Response.Write( "" );
            }
        }

        //订阅事件消息响应
        private void SubscribeResponse( string content, ref WxEventHandler evt )
        {
            CxxUtc utc = new CxxUtc(DateTime.Now);

            WxMsgHandler msg = new WxMsgHandler();
            msg.ToUser = evt.FromUser;
            msg.FromUser = evt.ToUser;
            msg.CreateTime = ( long )utc.ToUtcTime();
            msg.Content = content;
            msg.MsgType = WxMsgType.Text;

            Response.Write( msg.TextMsg() );
        }

        //文本消息响应
        private void TextMsgResponse( string content, ref WxMsgHandler msg )
        {
            CxxUtc utc = new CxxUtc(DateTime.Now);
            string _toUser = msg.ToUser;

            msg.ToUser = msg.FromUser;
            msg.FromUser = _toUser;
            msg.Content = content;
            msg.CreateTime = (long)utc.ToUtcTime();

            Response.Write( msg.TextMsg() );
        }
    }
}