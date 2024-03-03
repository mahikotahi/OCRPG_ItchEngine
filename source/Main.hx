package;

class Main extends Sprite
{
	public static var initialState:Class<FlxState> = SplashScreenState;

	public static var fpsVar:PerformanceDisplay;
	public static var saveIndicator:SaveIndicator;

	public static var versionString:String = 'Public Demo 1 (V: 1.0.0)';
	public static var itchEngineVersionString:String = 'March Prototype';
	
	public function new()
	{
		super();

		@:functionCode('
		#include <Window.h>
		SetProcessDPIAware()
		')
		
		#if debug
		initialState = SaveSelectState; // dont feel like watching the splashscreen 56 times
		#end

		addChild(new FlxGame(0, 0, initialState, 60, 60, false));

		Modding.loadMod();
		
		fpsVar = new PerformanceDisplay(10, 3, 0xFFFFFF);
		addChild(fpsVar);

		saveIndicator = new SaveIndicator();
		addChild(saveIndicator);

		SaveData.load();

		SaveData.updateSetting('isFullscreen');
		SaveData.updateSetting('performanceVisible');

	}
}
