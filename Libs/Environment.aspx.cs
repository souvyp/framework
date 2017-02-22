using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using NDS.Kits;
using NDS.Kits.Crypt;
using NDS.Kits.IO;
using NDS.Kits.Database;
using NDS.NML.Handler;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

namespace OTMS
{
    #region Environment TMS的统一界面代码处理类[Public]
    /// <summary>
    /// 统一界面代码处理类
    /// </summary>
    public partial class Environment : System.Web.UI.Page
    {
        #region 初始化
        /// <summary>
        /// 初始化
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load( object sender, EventArgs e )
        {
            //装载配置信息
            if ( !Config.Instance.IsInitialized )
            {
                Config.Instance.Load();
            }

            if ( !WxUserWrapper.VerifyUserStatus() )
            {
                StringBuilder sb = new StringBuilder();
                sb.Append( "<meta charset=\"UTF-8\">\r\n" );
                sb.Append( "<style>\r\n" );
                sb.Append( ".wrap{\r\n" );
                sb.Append( "width:100%;\r\n" );
                sb.Append( "line-height: 64px;\r\n" );
                sb.Append( "font-size: 36px;\r\n" );
                sb.Append( "color: #666666;\r\n" );
                sb.Append( "font-family: \"微软雅黑\";\r\n" );
                sb.Append( "display:-moz-box;\r\n" );
                sb.Append( "display:-webkit-box;\r\n" );
                sb.Append( "display:box;\r\n" );
                sb.Append( "-moz-box-pack:center;\r\n" );
                sb.Append( "-webkit-box-pack:center;\r\n" );
                sb.Append( "-o-box-pack:center;\r\n" );
                sb.Append( "box-pack:center;\r\n" );
                sb.Append( "margin-top: 100px;\r\n" );
                sb.Append( "}\r\n" );
                sb.Append( "</style>\r\n" );

                sb.Append( "		<div class=\"wrap\">\r\n" );
                sb.Append( "			<div><img src=\"/img/zhuyi.png\"></div>\r\n" );
                sb.Append( "			<div>&nbsp;&nbsp;无效的授权，或者没有在微信客户端中打开链接！</div>\r\n" );
		        sb.Append( "</div>\r\n" );
                Response.Write( sb.ToString() );
                Response.End();
            }
        }
        #endregion

        #region 类的私有函数
        #region IsUrlIgnoreSSOVerify 当前Url是否忽略SSO校验
        /// <summary>
        /// 当前Url是否忽略SSO校验
        /// </summary>
        /// <param name="sUrl">Url地址</param>
        /// <returns>是否忽略校验</returns>
        private bool IsUrlIgnoreSSOVerify( string sUrl )
        {
            if ( Config.Instance.sso.IgnoreUrl != null &&
                Config.Instance.sso.IgnoreUrl.Length > 0 )
            {
                string[] _ignore = Config.Instance.sso.IgnoreUrl.Split(",".ToCharArray());
                for ( int i = 0; i < _ignore.Length; i++ )
                {
                    string _name = _ignore[i].ToLower();
                    sUrl = sUrl.ToLower();

                    if ( sUrl.IndexOf( _name ) != -1 )
                    {
                        return true;
                    }
                }
            }

            return false;
        }
        #endregion
        #endregion

        #region 类的方法
        #region 通用
        #region IsContainsUrlPara 是否包含特定的Url参数[Public]
        /// <summary>
        /// 是否包含特定的Url参数
        /// </summary>
        /// <param name="name">Url参数名</param>
        /// <returns>是否包含</returns>
        public static bool IsContainsUrlPara( string name )
        {
            return WxUserWrapper.IsContainsUrlPara( name );
        }
        #endregion

        #region GetUrlPara 获取Url参数[Public]
        /// <summary>
        /// 获取Url参数
        /// </summary>
        /// <param name="key">键值</param>
        /// <param name="nNum">是否为整数</param>
        /// <returns>参数值</returns>
        public static string GetUrlPara( string key, bool nNum = true )
        {
            return WxUserWrapper.GetUrlPara( key, nNum );
        }
        #endregion
        #endregion

        #region MindMapMenu相关
        #region MindMapMenuUrl 根据模块的名称生成Url地址[Public]
        /// <summary>
        /// 根据模块的名称生成Url地址
        /// </summary>
        /// <param name="sModule">模块名</param>
        /// <returns>Url地址</returns>
        public string MindMapMenuUrl( string sModule )
        {
            StringBuilder sb = new StringBuilder();
            sb.Append( "/MMMenu.aspx?module=");
            sb.Append( sModule );
            sb.Append( "&role=" );
            sb.Append( GetUserInfo().RoleId.ToString() );
            sb.Append( "&ver=" );
            sb.Append( zMindMapMenu.CurrentVersion( sModule ).ToString() );

            return sb.ToString();
        }
        #endregion
        #endregion

        #region Minify相关
        #region MinifyUrl 根据Minify的名称生成Url地址[Public]
        /// <summary>
        /// 根据Minify的名称生成Url地址
        /// </summary>
        /// <param name="sName">名称</param>
        /// <returns>地址</returns>
        public string MinifyUrl( string sName )
        {
            StringBuilder sb = new StringBuilder();
            sb.Append( "/Minify.aspx?jcss=" );
            sb.Append( Config.Instance.MinifyParameters( sName ) );
            sb.Append( "&ver=" );
            sb.Append( zMinify.CurrentVersion() );
            
            return sb.ToString();
        }
        #endregion
        #endregion

        #region SSO相关
        #region VerifyUserStatus 登录校验
        /// <summary>
        /// 登录校验
        /// </summary>
        public void VerifyUserStatus( )
        {
            string sUrl = Request.Url.AbsolutePath.ToLower();

            if ( !SSOWrapper.IsSignedIn() )
            {
                if ( !IsUrlIgnoreSSOVerify( sUrl ) )
                {
                    zLogger.Instance.OperateLog( sUrl, Request.UserHostAddress, "Enviroment::VerifyUserStatus", "redirect", true );

                    Response.Redirect( "/Login.aspx" );
                }
            }
            else
            {
                zUser _user = SSOWrapper.GetUserInfo();

                if ( UserRole.Equal( _user.RoleId, UserRole.Sales ) ||
                    UserRole.Equal( _user.RoleId, UserRole.Buyer ) || 
                    UserRole.Equal( _user.RoleId, UserRole.OrderCreator ) || 
                    UserRole.Equal( _user.RoleId, UserRole.OrderReceiver ) )
                {
                    if ( sUrl.IndexOf( "/login.aspx" ) != -1 || sUrl == "/index.aspx" )
                    {
                        Response.Redirect( "/Index.aspx" );
                    }
                    else if ( !IsUrlIgnoreSSOVerify( sUrl ) )
                    {
                        //注销并重新登录
                        SSOWrapper.Signout( Config.Instance.WebsiteParameters( "SSODomain" ) );

                        Response.Redirect( "/Login.aspx" );
                    }
                }
                else
                {
                    //注销并重新登录
                    SSOWrapper.Signout( Config.Instance.WebsiteParameters( "SSODomain" ) );

                    Response.Redirect( "/Login.aspx" );
                }
            }
        }
        #endregion

        #region Now 获取当前时间[Public]
        /// <summary>
        /// 获取当前时间
        /// </summary>
        /// <returns></returns>
        public string Now( )
        {
            return zDate.Format( DateTime.Now, DateFormatStyle.Style( true, true, true, true ) );
        }
        #endregion

        #region IsSignedIn 是否已经登录[Public]
        /// <summary>
        /// 是否已经登录
        /// </summary>
        /// <returns></returns>
        public bool IsSignedIn( )
        {
            string sUrl = Request.Url.AbsolutePath.ToLower();
            zLogger.Instance.OperateLog( sUrl, Request.UserHostAddress, "Enviroment", "IsSignedIn", true );

            return SSOWrapper.IsSignedIn( );
        }
        #endregion

        #region GetUserInfo 获取当前登录的用户信息[Public]
        /// <summary>
        /// 获取当前登录的用户信息
        /// </summary>
        /// <returns>用户对象</returns>
        public zUser GetUserInfo( )
        {
            try
            {
                return SSOWrapper.GetUserInfo();
            }
            catch
            {
                return new zUser();
            }
        }
        #endregion

        #region GetTruename 获取当前登录用户的真实姓名[Public]
        /// <summary>
        /// 获取当前登录用户的真实姓名
        /// </summary>
        /// <returns>姓名</returns>
        public string GetTruename( )
        {
            try
            {
                return GetUserInfo().Truename;
            }
            catch
            {
                return "";
            }
        }
        #endregion

        #region GetUsername 获取当前登录用户的账号名[Public]
        /// <summary>
        /// 获取当前登录用户的账号名
        /// </summary>
        /// <returns>账号名</returns>
        public string GetUsername( )
        {
            try
            {
                return GetUserInfo().Username;
            }
            catch
            {
                return "";
            }
        }
        #endregion

        #region GetUserID 获取当前登录用户的编号[Public]
        /// <summary>
        /// 获取当前登录用户的编号
        /// </summary>
        /// <returns>用户编号</returns>
        public string GetUserID( )
        {
            try
            {
                return GetUserInfo().Id.ToString();
            }
            catch
            {
                return "";
            }
        }
        #endregion
        #endregion
        #endregion
    }
    #endregion
}