/*
Depend on:
jQuery-1.10.2.js
NSF.js
NSF.System.js
*/
///<reference path="NSF.js">
///<reference path="NSF.System.js">

NSF.System.Converter = function ()
{
    
    //properties
    this.Name = "NSF.System.Converter";
    this.Author = "Guo HongLiang";
    this.Version = "0.0.1";
    this.PublishDate = "2015-2-5";

    //constructor
    function constructor()
    {
        //do nothing
    }
    {
        constructor();
    }
};

/*
description:
    converter the html content to doc file
parameters:
 _html   导出项带标签内容
 _css    导出项所含CSS样式
 _name   传入自定义指定文件名称
returns:

example:
*/
NSF.System.Converter.ToDoc = function ( _html, _css, _name )
{
    //word文档的头部
    function Header()
    {
        var str = "";
        str += '<html xmlns:o="urn:schemas-microsoft-com:office:office"';
        str += 'xmlns:w="urn:schemas-microsoft-com:office:word"';
        str += 'xmlns="http://www.w3.org/TR/REC-html40">';
        str += '<head>';
        str += '<meta http-equiv=Content-Type  content="text/html; charset=gb2312" >';
        str += '<title></title>';
        str += '<!--[if gte mso 9]>';
        str += '<xml>';
        str += '<w:WordDocument>';
        str += '<w:BrowserLevel>MicrosoftInternetExplorer4</w:BrowserLevel>';
        str += '<w:DisplayHorizontalDrawingGridEvery>0</w:DisplayHorizontalDrawingGridEvery>';
        str += '<w:DisplayVerticalDrawingGridEvery>2</w:DisplayVerticalDrawingGridEvery>';
        str += '<w:DocumentKind>DocumentNotSpecified</w:DocumentKind>';
        str += '<w:DrawingGridVerticalSpacing>7.8 磅</w:DrawingGridVerticalSpacing>';
        str += '<w:PunctuationKerning></w:PunctuationKerning>';
        str += '<w:View>Web</w:View>';
        str += '<w:Compatibility>';
        str += '<w:DontGrowAutofit/>';
        str += '<w:BalanceSingleByteDoubleByteWidth/>';
        str += '<w:DoNotExpandShiftReturn/>';
        str += '<w:UseFELayout/>';
        str += '</w:Compatibility>';
        str += '<w:Zoom>0</w:Zoom>';
        str += '</w:WordDocument>';
        str += '</xml>';
        str += '<![endif]-->';
        str += Style();
        str += '</head><body>';

        return str;
    }

    //style样式
    function Style()
    {
        var str = "";

        if ( _css != null && _css != "" )
        {
            str += '<style>';
            str += _css;
            str += '</style>';
        }

        return str;
    }

    //生成整个网页代码
    function Generator()
    {       
        var str = Header();

        if ( _html != null && _html != "" )
        {
            str += _html;
        }
        
        str += Footer();

        return str;
    }

    //word文档的底部
    function Footer( )
    {
        return '</body></html>';
    }

    //刷新生成word文档
    function Flush( str )
    {
        var a = document.createElement( 'a' );
        var blob = new Blob( [str], { 'type': 'application\/msword' } );
        a.href = window.URL.createObjectURL( blob );
        a.download = '' + _name + '.doc';
        a.click();

        return;
    }

    //constructor
    function constructor()
    {
        //please note that it is a private function, so you can call the public fields or methods only
        //do the private visiting in the following {}
        var __content = Generator();

        Flush( __content );
    }
    {
        constructor();
    }
};

/*
description:
    converter the html content to xls file
parameters:
	srcObj 导出项内容
	 _name 导出项 自定义名称
returns:

example:
*/
NSF.System.Converter.ToXls = function ( srcObj, _name )
{   
    var str = srcObj.outerHTML();

    var a = document.createElement( 'a' );
    var blob = new Blob( [str], { 'type': 'application\/octet-stream' } );
    a.href = window.URL.createObjectURL( blob );
    a.download = _name + '.xls';
    a.click();

    return;
};
