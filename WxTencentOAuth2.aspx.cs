using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using NDS.Kits;
using NDS.Kits.Codec;
using NDS.Widgets.Weixin;

namespace OTMS
{
    public partial class WxTencentOAuth2 : System.Web.UI.Page
    {
        protected void Page_Load( object sender, EventArgs e )
        {
            if ( !Config.Instance.IsInitialized )
            {
                Config.Instance.Load();
            }

            string sCode = Request.QueryString[ "code" ];
            string sState = Request.QueryString[ "state" ];
            string sToken = "", 
                sRefreshToken = "", 
                sOpenId = "";

            //通过Code换取网页授权Token
            if ( sCode != null &&
                sState != null &&
                sCode.Length > 0 &&
                sState.Length > 0 )
            {
                WxOAuthHandler.Code2TokeAndOpenId( sCode, ref sToken, ref sRefreshToken, ref sOpenId );
                if ( sOpenId.Length > 0 )
                {
                    try
                    {
                        sState = Encoding.UTF8.GetString( zHex.Hex2Bytes( sState ) );

                        if ( sState.IndexOf( "?" ) != -1 )
                        {
                            sState += "&openid=" + sOpenId;
                        }
                        else
                        {
                            sState += "?openid=" + sOpenId;
                        }

                        Response.Redirect( sState );
                    }
                    catch (Exception ex)
                    {
                        //
                    }
                }
            }

            Response.Write( "无效的授权，请微信客户端中使用相关功能！" );
        }
    }
}