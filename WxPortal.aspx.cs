using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using NDS.Kits;
using NDS.NML.Handler;
using NDS.Widgets.Weixin;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
/*
using System.Net;
using System.Net.Security;
using System.IO;
using System.Security.Cryptography.X509Certificates;
*/
using System.Net.Http;

namespace OTMS
{
    public partial class WxPortal : System.Web.UI.Page
    {
        protected void Page_Load( object sender, EventArgs e )
        {
            if ( !Config.Instance.IsInitialized )
            {
                Config.Instance.Load();
            }

            //自动获取Token
            string sToken = WxNormalHandler.GetToken();
            if ( sToken.Length == 0 )
            {
                JObject res = new JObject();
                res.Add( "result", false );
                res.Add( "err", WxErrors.WXKITS_FAILED_TO_GET_TOKEN.Code );
                res.Add( "msg", WxErrors.WXKITS_FAILED_TO_GET_TOKEN.Description );

                Response.Write( res.ToString() );
            }
            else
            {
                string action = Request.QueryString[ "action" ];
                if ( action == null )
                {
                    action = "";
                }

                int nError = 0;
                string sErrMsg = "";

                #region 添加菜单
                if ( action == "addMenu" )
                {
                    byte[] bReq = Request.BinaryRead( Request.TotalBytes );
                    if ( bReq.Length > 0 )
                    {
                        string sReq = Encoding.UTF8.GetString( bReq );
                        if ( sReq.Length > 0 )
                        {
                            try
                            {
                                JObject jReq = JObject.Parse( sReq );
                                WxMenuHandler.Create( ref jReq, ref nError, ref sErrMsg );
                            }
                            catch ( Exception ex )
                            {
                                nError = WxErrors.UNKNOWN_EXCEPTION.Code;
                                sErrMsg = ex.ToString();
                            }
                        }
                        else
                        {
                            nError = WxErrors.UNKNOWN_EXCEPTION.Code;
                            sErrMsg = "The request is invalid!";
                        }
                    }
                    else
                    {
                        nError = WxErrors.UNKNOWN_EXCEPTION.Code;
                        sErrMsg = "The request is empty!";
                    }
                }
                #endregion

                #region 删除菜单
                else if ( action == "delMenu" )
                {
                    WxMenuHandler.Delete( ref nError, ref sErrMsg );
                }
                #endregion

                #region 发送模板消息
                /*
                * {
                *      "openid" : "openid",
                *      "drivername" : "司机姓名",
                *      "url" : "地址",
                *      "orderid" : "订单编号",
                *      "customername" : "客户名称",
                *      "toaddress" : "收货地址",
                *      "totime" : "收货时间",
                *      "tocontact" : "联系电话"
                * }
                */
                else if ( action == "sendTplMsg" )
                {
                    byte[] bReq = Request.BinaryRead( Request.TotalBytes );
                    if ( bReq.Length > 0 )
                    {
                        string sReq = Encoding.UTF8.GetString( bReq );
                        if ( sReq.Length > 0 )
                        {
                            try
                            {
                                JObject jPara = JObject.Parse( sReq );
                                string sMsg = WxTmplMsgHandler.NewOrderWxNotice( jPara[ "openid" ].ToString(),
                                    jPara[ "drivername" ].ToString(),
                                    jPara[ "url" ].ToString(),
                                    jPara[ "orderid" ].ToString(),
                                    jPara[ "customername" ].ToString(),
                                    jPara[ "toaddress" ].ToString(),
                                    jPara[ "totime" ].ToString(),
                                    jPara[ "toaddress" ].ToString(),
                                    "" );
                                JObject jReq = JObject.Parse( sMsg );

                                JObject jRes = new JObject();
                                Send( sToken, ref jReq, ref jRes );
                                if ( jRes[ "errcode" ] != null )
                                {
                                    if ( jRes[ "errcode" ].ToString() == "0" )
                                    {
                                        nError = 0;
                                        sErrMsg = jRes[ "msgid" ].ToString();
                                    }
                                    else
                                    {
                                        nError = Convert.ToInt32( jRes[ "errcode" ].ToString() );
                                        sErrMsg = jRes[ "errmsg" ].ToString();
                                    }
                                }
                                else
                                {
                                    nError = WxErrors.TENCENT_RESPONSE_FORMAT_WRONG.Code;
                                    sErrMsg = WxErrors.TENCENT_RESPONSE_FORMAT_WRONG.Description;
                                }
                            }
                            catch ( Exception ex )
                            {
                                nError = WxErrors.UNKNOWN_EXCEPTION.Code;
                                sErrMsg = ex.ToString();
                            }
                        }
                        else
                        {
                            nError = WxErrors.UNKNOWN_EXCEPTION.Code;
                            sErrMsg = "The request is invalid!";
                        }
                    }
                    else
                    {
                        nError = WxErrors.UNKNOWN_EXCEPTION.Code;
                        sErrMsg = "The request is empty!";
                    }
                }
                #endregion

                else
                {
                    nError = WxErrors.UNKNOWN_EXCEPTION.Code;
                    sErrMsg = "Unsupported action!";
                }

                JObject res = new JObject();
                res.Add( "result", ( nError == 0 ) );
                res.Add( "err", nError );
                res.Add( "msg", sErrMsg );

                Response.Write( res.ToString() );
            }
        }

        private void Send( string sToken, ref JObject _req, ref JObject _res )
        {
            return;
        }

        /*
        private bool HttpsValidationResult( object sender, X509Certificate certificate, X509Chain chain, SslPolicyErrors errors )
        {
            return true;
        }

        private void Send( string sToken, ref JObject _req, ref JObject _res )
        {
            try
            {
                StringBuilder url = new StringBuilder();
                url.Append( "https://api.weixin.qq.com/cgi-bin/template/send?access_token=" );
                url.Append( Server.UrlEncode(sToken) );

                string sReq = _req.ToString();

                string html = "";
                ServicePointManager.ServerCertificateValidationCallback = new RemoteCertificateValidationCallback( HttpsValidationResult );

                HttpWebRequest req = ( HttpWebRequest )WebRequest.Create( url.ToString() );
                req.CookieContainer = new CookieContainer();
                req.AllowAutoRedirect = true;
                req.Method = "POST";
                req.ContentType = "application/x-www-form-urlencoded";
                req.UserAgent = "Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36";

                byte[] _content = Encoding.UTF8.GetBytes( sReq );
                req.ContentLength = _content.Length;

                if ( _content.Length > 0 )
                {
                    HttpWebResponse response = null;
                    Stream stream = null;
                    StreamReader reader = null;
                    try
                    {
                        stream = req.GetRequestStream();
                        stream.Write( _content, 0, _content.Length );

                        response = ( HttpWebResponse )req.GetResponse();
                        reader = new StreamReader( response.GetResponseStream(), Encoding.UTF8 );
                        html = reader.ReadToEnd();
                    }
                    catch
                    {
                        html = "";
                    }
                    finally
                    {
                        if ( stream != null )
                        {
                            stream.Close();
                            stream.Dispose();
                        }
                        if ( reader != null )
                        {
                            reader.Close();
                            reader.Dispose();
                        }
                        if ( response != null )
                        {
                            response.Close();
                        }
                    }
                }

                _res = JObject.Parse( html );
            }
            catch
            {
                return;
            }
        }
        */
    }
}