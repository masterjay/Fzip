package
{
	import events.tiCompareCompleteEvents;
	
	import flash.display.Sprite;
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;

	[Event(name="compareAll", type="events.tiCompareCompleteEvents")]
	[Event(name="compareConfig", type="events.tiCompareCompleteEvents")]
	[Event(name="compareAB", type="flash.events.Event")]
	public class tiCompare extends Sprite
	{
		public function tiCompare()
		{
		}
		public var A:Array=new Array();
		public var B:Array=new Array();
		public var conflictCollection:Array=new Array();
		public var conflictCollectionAB:Array=new Array();
		public function doCompare(ar:Array,ar2:Array,fileNameAll:String,fileNameA:String,fileNativePathAll:String,fileNativePathA:String,flag:String):void
		{
		
			
			for(var i:int=0;i<ar2.length;i++)
			{
				for(var j:int=0;j<ar.length;j++)
				{
					if(ar2[i]==ar[j])
					{
						//trace(fileName+  "name")
						
						conflictCollection.push({nameA:fileNameAll,nameB:fileNameA,NativePathA:fileNativePathAll,NativePathB:fileNativePathA,data:ar[j]});
						
						//trace(conflictCollection)
					}						
				}
			}
			
			//Alert.show("compare finish, not conflict")
			var dis:tiCompareCompleteEvents;
			if(flag=="compareAll")
			{
				dis=new tiCompareCompleteEvents("compareAll",1);
				
			}
			else if(flag=="compareConfig")
			{
				dis=new tiCompareCompleteEvents("compareConfig",1);
			}
			this.dispatchEvent(dis)
		}
	//	private var ar:Array=new Array("b","a","c")//ar i
	//	private var ar2:Array=new Array("a","d","e","f");//ar2 j	
		public function doCompareAB(ar:Array,ar2:Array):void
		{
			//ar=new Array("b","a","c")
			//ar2=new Array("a","d","e","f")
			var ar2Copy:Array=ar.concat();
			var ar3Copy:Array=ar2.concat();
			var arr2Copy:Array=ar.concat();
			var arr3Copy:Array=ar2.concat();
			this.A=ar3Copy
				
			
			
			for(var i:int=0;i<ar2Copy.length;i++)
			{
				for(var j:int=0;j<ar3Copy.length;j++)
				{
					if(ar2Copy[i]==ar3Copy[j])//陣列值一樣
					{
						
						var s:int=this.A.indexOf(ar2Copy[i]);
						if(s!=-1)
						{
							this.A.splice(s,1);
						}
						
					}
					
				}
			}
			trace(A+"  A")
			trace(conflictCollectionAB+ "  conflictCollectionAB.push(ar[i]);")
		//	this.ar=new Array("b","a","c","f","g","h")
		//	this.ar2=new Array("a","d","e","f","c")
			
			this.doCompareAB2(arr2Copy,arr3Copy);
		}
		public function doCompareAB2(ar:Array,ar2:Array):void
		{
			//ar=new Array("b","a","c")
			//ar2=new Array("a","d","e","f")
			this.B=ar
					
			for(var j:int=0;j<ar2.length;j++)
			{
				for(var i:int=0;i<ar.length;i++)
				{
					
					if(ar[i]==ar2[j])//陣列值一樣
					{
						conflictCollectionAB.push(ar[i]);
						//trace(ar2[j]+"ar2[j]")
						var s:int=B.indexOf(ar2[j]);
						if(s!=-1)
						{
							
							B.splice(s,1);
						}
						
					}
					
				}
			}
			trace(B+ "  B")
			trace(conflictCollectionAB+ "  conflictCollectionAB.push(ar[i]);")
			this.dispatchEvent(new Event("compareAB"));
		}
	}
}