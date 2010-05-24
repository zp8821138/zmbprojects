package{
	import flash.display.Sprite;
	import flash.ui.ContextMenu;
	import flash.ui.ContextMenuItem;
	import flash.events.ContextMenuEvent;
	
	public class Main extends Sprite{
		
		private var myContextMenu:ContextMenu;
		
		private var helloWorld:ContextMenuItem=new ContextMenuItem("Hello world");
		
		public function Main(){
			myContextMenu=new ContextMenu;
			myContextMenu.hideBuiltInItems();
			myContextMenu.customItems.push(helloWorld);
			contextMenu=myContextMenu;
			
			helloWorld.addEventListener(ContextMenuEvent.MENU_ITEM_SELECT,selectItemHandler);
			
		}
		
		private function selectItemHandler(event:ContextMenuEvent):void{
			trace("Hello World");
		}
	}
}