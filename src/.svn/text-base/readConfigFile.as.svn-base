package
{
	
	
	import events.tiCompareABcompeleteEvents;
	import events.tiCompareCompleteEvents;
	
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.ErrorEvent;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.text.TextField;
	import flash.xml.XMLDocument;
	
	import mx.collections.ArrayCollection;
	import mx.collections.ArrayList;
	import mx.collections.XMLListCollection;
	import mx.controls.Alert;
	import mx.utils.XMLUtil;
	[Event(name="ERROR", type="flash.events.Event")]
	public class readConfigFile extends Sprite 
	{
		
		public var ar:Array=new Array();
		private var config:String="<path><name>D://assets/</name></path>"
		
		public var xml:XML=new XML();
		public var xmlNew:XML=new XML();
		[Bindable]
		public var swcName:Array=new Array();//存取所有SWC檔路徑 名稱	
 		public var nativePath:Array=new Array();
		public var configLength:int;
		public function readConfigFile()
		{
		}
		//讀取config路徑
		//D://assets/
		public function searchConfigFile():void
		{
			var file:File=File.documentsDirectory.resolvePath("catalog.xml");
			
				
			//file.nativePath="C:/Program Files (x86)/Fzip/config.xml"
			//file.nativePath="D:/config.xml"
 			//File.applicationDirectory.nativePath("config.xml");
			var fs:FileStream=new FileStream();
			fs.open(file,FileMode.UPDATE);//若無檔案則建立新檔案
			if(fs.bytesAvailable==0)
			{
				fs.open(file,FileMode.WRITE);
				fs.writeUTFBytes(config);
				//fs.close()
			}
			else if(fs.bytesAvailable!=0)
			{
				xml= new XML(fs.readUTFBytes(fs.bytesAvailable));
			}
			
			fs.close()
			
			
			var flag:Boolean=false;
			for(var i:int=0;i<xml.name.length();i++)
				//for(var i:int=0;i<config.name.length();i++)
			{ 
				try
				{
					var directory:File=new File(xml.name[i])
					directory.getDirectoryListing()
				}
				catch(e:Error)
				{//找不到預設路徑拋出例外
					
					flag=true;
					Alert.show( "Path: "+xml.name[i]+" can not be found","ERROR");
				}
				
				this.ar.push(xml.name[i].toString());
				
			}
			if(flag==false)
			{
				this.fnCountSWC() 
				
			}
			this.readNewXML();
		}
		
			//找尋預設資料路徑內所有SWC檔案名稱
		private function fnCountSWC():void
		{
			for(var i:int;i<ar.length;i++)
			{
				var directory:File = new File(ar[i]);
					
					
				var temp:Array=directory.getDirectoryListing();//取得文件目錄中檔案和子資料夾的 File 物件陣列
				
			for (var j:uint = 0; j < temp.length; j++)
				{
					swcName.push({name:temp[j].name,nativePath:directory.nativePath+'\\'+temp[j].name});
				}	
				configLength=swcName.length;
			}
		}
			//讀取上次新增的SWC檔
		private function readNewXML():void
		{
				var file:File=File.documentsDirectory.resolvePath("new.xml");
				
				//file.nativePath="C:/Program Files (x86)/Fzip/new.xml"
			//	File.desktopDirectory.resolvePath("new.xml");
				//file.nativePath="D:/new.xml"
				var fs:FileStream=new FileStream();
				fs.open(file,FileMode.UPDATE);
				if(fs.bytesAvailable==0)
				{
					fs.open(file,FileMode.WRITE);
					var config:String="<path></path>";//若無檔案則建立新檔案
					xmlNew=new XML(config)
					fs.writeUTFBytes(xmlNew.toXMLString());
					//fs.close()
				}
				else if(fs.bytesAvailable!=0)
				{
				xmlNew= new XML(fs.readUTFBytes(fs.bytesAvailable));
				}
				
				
				fs.close()
				
				for(var k:int=0;k<xmlNew.children().length();k++)
				{
					swcName.push({name:xmlNew.data[k].name,nativePath:xmlNew.data[k].nativePath});
					
				}
			
		}
	}
}
