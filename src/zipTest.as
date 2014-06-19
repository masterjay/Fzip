package
{
	import deng.fzip.FZip;
	import deng.fzip.FZipFile;
	
	import events.tiCompleteEvents;
	
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.filesystem.File;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.text.TextField;
	import flash.xml.XMLDocument;
	
	import mx.collections.ArrayCollection;
	import mx.collections.ArrayList;
	import mx.collections.XMLListCollection;
	import mx.controls.Alert;
	
	[Event(name="OK", type="events.tiCompleteEvents")]
	
	public class zipTest extends Sprite
	{
		private var myZip:FZip;
		private var id:String;
		private var flag:int;
		public var data:Array=new Array();
		
		//public var url:String="../assets/footer.swc";
		//public var ar:Array=["../assets/777_740X555_all.swc", "../assets/footer.swc"]
		//public var ar:Array=["C:/Users/jay.liao53/Adobe Flash Builder 4.5/as3zip/assets/footer.swc"]
		
		private var ar:Array;//包含所有SWC檔案名稱陣列
		private var m_nIndex:Number=0;
		private var fileName:String;
		private var fileNativePath:String;
		
		public function zipTest()
		{
			
			
		}
		
		//將欲解壓縮的SWC檔案資料輸入	ar檔案路徑 id作為flag判別  fileName 檔案名稱 fileNativePath 完整路徑
		public function setswcName(ar:Array,id:String,fileName:String,fileNativePath:String):void
		{
			this.data.length=0;
			this.m_nIndex=0;
			this.ar=ar;
			this.id=id
			this.fileName=fileName
			this.fileNativePath=fileNativePath;	
			this.fnNext()
				
		}
		
		
		//一次解壓縮N筆資料  但目前只有一次解縮一個SWC檔
		private function fnNext():void
		{
			//trace(ar.length)
			if(ar.length>m_nIndex)
			{
				zipOpendata(ar[m_nIndex]);
				
			} 
			else
			{
				this.dispatchEvent(new tiCompleteEvents("OK",id,fileName,fileNativePath));
			}
		}
		//將SWC檔案解壓縮
		public function zipOpendata(ar:String):void
		{
			myZip= new FZip();
			var urlrequest:URLRequest=new URLRequest();
			
			
				urlrequest.url=ar;
				myZip.addEventListener(Event.COMPLETE,getZipFileComplete);
				myZip.load(urlrequest);
				
			
				
		}
		//提取catalog.xml 檔
		private function getZipFileComplete(e:Event):void
		{
			//trace("getZipFileComplete")
			var count:uint = 0;
			for(var i:int=0; i<myZip.getFileCount(); i++)
			{
				
				var file:FZipFile = myZip.getFileAt(i);
				//trace(file.filename);
			//	Alert.show(file.filename.indexOf(".xml")+"");
				if(file.filename.indexOf(".xml")!=-1)
				{
					
					data.push(file.content)
					//trace(data[m_nIndex])
				}
			}
			
			m_nIndex++;
			this.fnNext()
				
		}
		
	}
}