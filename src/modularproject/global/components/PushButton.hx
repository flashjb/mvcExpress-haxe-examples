package modularproject.global.components;

import flash.display.Sprite;
import flash.filters.DropShadowFilter;
import flash.display.DisplayObjectContainer;
import flash.events.MouseEvent;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.text.TextFormatAlign;
import flash.text.TextFormat;


class PushButton extends Sprite
{
	public var label(get_label, set_label) : String;
	//override public var width(getWidth, setWidth) : Float;
	
	var _back:Sprite;
	var _face:Sprite;
	var _label:TextField;
	var _labelText:String = "";
	
	var _over:Bool = false;
    var _down:Bool= false;
    var _selected:Bool= false;
    var _toggle:Bool= false;
				
	var _width  : Float = 0;
    var _height : Float = 0;
				
	public function new (parent:DisplayObjectContainer = null, xpos:Float = 0, ypos:Float =  0, label:String = "", defaultHandler:Dynamic->Void = null)
	{
		super();
		
		move(xpos, ypos);
        if(parent != null)	parent.addChild(this);
		
        init();
		
		if(defaultHandler != null) addEventListener(MouseEvent.CLICK, defaultHandler);
        this.label = label;
	}
                
    function init() : Void
    {
	    initSize(100, 20);
		
		_back = new Sprite();
        _back.filters = [getShadow(2, true)];
        //_back.mouseEnabled = false;
        addChild(_back);
        
        _face = new Sprite();
      //  _face.mouseEnabled = false;
        _face.filters = [getShadow(1)];
        _face.x = 1;
        _face.y = 1;
        addChild(_face);
        
        
		
			
		_label = new TextField();
		_label.text 		= _labelText;
		_label.selectable 	= false;
		_label.mouseEnabled = false;
		_label.autoSize = TextFieldAutoSize.CENTER;
		
        addChild(_label);
        
        addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
        addEventListener(MouseEvent.ROLL_OVER,  onMouseOver);
		
		buttonMode = true;
	    useHandCursor = true;
	    mouseChildren = false;
	    mouseEnabled  = true;
	    useHandCursor = true;
		
		draw();
    }
	
	public function draw() : Void
    {
        _back.graphics.clear();
        _back.graphics.beginFill( 0x1A1A1A );
        _back.graphics.drawRect(0, 0, _width, _height);
        _back.graphics.endFill();
        
        _face.graphics.clear();
        _face.graphics.beginFill( 0xDEDEDE );
        _face.graphics.drawRect(0, 0, _width - 2, _height - 2);
        _face.graphics.endFill();
        
        
        _label.text = _labelText;
		var txtFmt : TextFormat = new TextFormat();
			txtFmt.size = 9;
			txtFmt.font = "Verdana";
		_label.setTextFormat(txtFmt);
		
		
        if(_label.width > _width - 4)
        {
        	_label.autoSize = TextFieldAutoSize.NONE;
			_label.width = _width - 4;
        }
        else
        {
			_label.autoSize = TextFieldAutoSize.LEFT;
        }
		
        _label.x =  ( _width  - _label.width  ) * .5;
		_label.y =  ( _height - _label.height ) * .5;
    }
                
	 
	function onMouseDown(event:MouseEvent) : Void
	{
		_down = true;
		#if flash _face.filters = [getShadow(4, true)]; #end
		stage.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
	}
	

	function onMouseUp(event:MouseEvent) : Void
	{
	    if(_toggle  && _over)
	    {
	       _selected = !_selected;
	    }
	    _down = _selected;
	    #if flash  _face.filters = [getShadow(1, _selected)]; #end
	    stage.removeEventListener(MouseEvent.MOUSE_UP, onMouseUp);
	}

    function onMouseOver(event:MouseEvent) : Void
    {
		_over = true;
		#if flash _face.filters = [getShadow(2, true)]; #end
		addEventListener(MouseEvent.ROLL_OUT, onMouseOut);
    }
    
    function onMouseOut(event:MouseEvent) : Void
    {
        _over = false;
        if(!_down)
        {
        	#if flash _face.filters = [getShadow(1)]; #end
        }
        removeEventListener(MouseEvent.ROLL_OUT, onMouseOut);
    }
    
	function getShadow( d:Float, b:Bool = false ) : DropShadowFilter
    {
    	return new DropShadowFilter(d, 60, 0x121212, .51, d, d, .3, 1, b);
    }
	                   	
	public function setSize(w:Float, h:Float) : Void
    {
    	_width  = w;
        _height = h;
		draw();
    }
	                       	
	function initSize(w:Float, h:Float) : Void
    {
    	_width  = w;
        _height = h;
    }
	         
    function move(xpos:Float, ypos:Float) : Void
    {
		x = Math.round(xpos);
		y = Math.round(ypos);
    }
	
	
	function get_label() : String {
		return label = _labelText;
	}
	function set_label( value : String ) : String 
	{
		_labelText = value;
		draw();
		return _labelText;
	}
	
}
