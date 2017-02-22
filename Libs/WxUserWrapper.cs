using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using NDS.Kits;
using NDS.Kits.Database;

namespace OTMS
{
    #region WxUserWrapper 微信用户封装类[Public]
    /// <summary>
    /// 微信用户封装类
    /// </summary>
    public class WxUserWrapper
    {
        #region 类的静态方法
        #region IsUrlIgnore 当前Url是否忽略校验
        /// <summary>
        /// 当前Url是否忽略校验
        /// </summary>
        /// <param name="sUrl">Url地址</param>
        /// <returns>是否忽略校验</returns>
        public static bool IsUrlIgnore( string sUrl )
        {
            if ( Config.Instance.sso.IgnoreUrl != null &&
                Config.Instance.sso.IgnoreUrl.Length > 0 )
            {
                string[] _ignore = Config.Instance.sso.IgnoreUrl.Split( ",".ToCharArray() );
                for ( int i = 0; i < _ignore.Length; i++ )
                {
                    string _name = _ignore[ i ].ToLower();
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

        #region IsContainsUrlPara 是否包含特定的Url参数[Public]
        /// <summary>
        /// 是否包含特定的Url参数
        /// </summary>
        /// <param name="name">Url参数名</param>
        /// <returns>是否包含</returns>
        public static bool IsContainsUrlPara( string name )
        {
            try
            {
                string _value = HttpContext.Current.Request.QueryString[ name ];
                if ( _value.Length > 0 )
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch
            {
                return false;
            }
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
            try
            {
                string value = HttpContext.Current.Request.QueryString[ key ].ToString();
                if ( value.Length > 0 )
                {
                    return value;
                }
                else
                {
                    if ( nNum )
                    {
                        return "0";
                    }
                    else
                    {
                        return "";
                    }
                }
            }
            catch
            {
                if ( nNum )
                {
                    return "0";
                }
                else
                {
                    return "";
                }
            }
        }
        #endregion

        #region VerifyUserStatus 登录校验[Public]
        /// <summary>
        /// 登录校验
        /// </summary>
        /// <param name="url_chk">是否忽略特定URL</param>
        /// <returns>是否登录</returns>
        public static bool VerifyUserStatus( bool url_ignor = true )
        {
            string sUrl = HttpContext.Current.Request.Url.AbsolutePath.ToLower();
            string sOpenId = GetUrlPara( "OpenId", false );
            if ( sOpenId == "" || sOpenId.Length == 0 )
            {
                return false;
            }

            //网页是否忽略数据库校验
            if ( url_ignor && IsUrlIgnore( sUrl ) )
            {
                return true;
            }

            //创建数据库连接
            MSConnection conn = new MSConnection();
            conn.Initialize( Config.Instance.m_DbConfig, true );

            if ( !conn.Create() )
            {
                conn.Close();

                return false;
            }
            if ( conn.conn == null || !conn.Connected )
            {
                conn.Close();

                return false;
            }

            //从数据库中读取
            StringBuilder sql = new StringBuilder();
            sql.Append( "SELECT TOP 1 [User_ID] FROM TMS_User WHERE User_OpenId = '" );
            sql.Append( sOpenId );
            sql.Append( "' AND User_Invalid = 0 AND User_Type = 2" );

            string userid = MSDBGeneral.getValue( sql.ToString(), ref conn.conn );
            userid = userid.Trim();

            conn.Close();

            if ( userid == "" || userid.Length == 0 )
            {
                return false;
            }
            else
            {
                return true;
            }
        }
        #endregion
        #endregion
    }
    #endregion
}