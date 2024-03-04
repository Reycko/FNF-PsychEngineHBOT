package options;

import haxe.rtti.CType.FunctionArgument;

class HBotSettingsSubState extends BaseOptionsMenu
{
    public function new()
    {
        title = 'HBot';
        rpcTitle = 'HBot Settings Menu';

        //TODO: Compile these into a singular array using an object or smth
        var optionNames:Array<String> = [
            'Silent', 'Allow Input', 'Allow Miss', 'LUA Spoof', 
            'Allow Achivements', 'Min variance', 'Max variance', 
            'Random seed generation type',
        ];

        var optionDescriptions:Array<String> = [
             //TODO: REPHRASE THIS SENTENCE
            'Changes some behaviours to make the game look more like gameplay without botplay.',
            
            'Allows user input when botplay is on.\nNote: This will let you hit notes.',

            'Psych Engine disables note misses if botplay is on, this option toggles that.',

            'Tells LUA scripts that botplay is off even when it is on.',

            'Allows achivements to be obtained when botplay is on.',

            'Example: -2 => Minimum of 2ms early when hitting a note.',

            'Example: 6 => Maximum of 6ms late when hitting a note.',

            'If true => Generate seed every note hit, might cause lag.\nIf false => Generate seed once, and use it for the entire song.',
        ];

        var optionSaveDataName:Array<String> = [
            'cpuSilent', 'cpuAllowInput', 'cpuAllowMiss', 'cpuLuaSpoof', 
            'cpuAllowAchivements', 'cpuMinVariance', 'cpuMaxVariance', 'cpuSeedGenType'
        ];

        var optionSaveType:Array<String> = [
            'bool', 'bool', 'bool', 'bool', 'bool', 'float', 'float', 'bool'
        ];

        var optionDisplayFormat:Array<String> = [
            null, null, null, null, null, "%vms", "%vms", null
        ];

        //TODO: Stop using arrays w/ loops, that was a shit idea
        for (i in 0...optionSaveDataName.indexOf('cpuAllowAchivements')) // We're adding the next 2 after that manually beacuse they SUCK.
        {
            var name = optionNames[i];
            var desc = optionDescriptions[i];
            var saveName = optionSaveDataName[i];
            var saveType = optionSaveType[i];

            addOption(new Option(name, desc, saveName, saveType));
        }

        //TODO: Find a better workaround for these 2 bitches
        var minVarianceI = optionSaveDataName.indexOf('cpuMinVariance');
        var name = optionNames[minVarianceI];
        var desc = optionDescriptions[minVarianceI];
        var saveName = optionSaveDataName[minVarianceI];
        var saveType = optionSaveType[minVarianceI];
        var opt = new Option(name, desc, saveName, saveType);
		opt.displayFormat = '%vms';
		opt.scrollSpeed = 20;
        opt.changeValue = 0.1;
        addOption(opt);

        var name = optionNames[minVarianceI+1];
        var desc = optionDescriptions[minVarianceI+1];
        var saveName = optionSaveDataName[minVarianceI+1];
        var saveType = optionSaveType[minVarianceI+1];
        var opt = new Option(name, desc, saveName, saveType);
		opt.displayFormat = '%vms';
		opt.scrollSpeed = 20;
        opt.changeValue = 0.1;
        addOption(opt);

        for (i in optionSaveDataName.indexOf('cpuMaxVariance')+1...optionSaveDataName.length)
        {
            var name = optionNames[i];
            var desc = optionDescriptions[i];
            var saveName = optionSaveDataName[i];
            var saveType = optionSaveType[i];

            addOption(new Option(name, desc, saveName, saveType));
        }

        var opt:Option = new Option(
            'Strum Glow Multiplier',
            'Changes the multiplier for the strum glow.',
            'cpuLegitStrumGlow',
            'float',
        );
        opt.displayFormat = '%vx';
        opt.scrollSpeed = 10;
        opt.changeValue = 0.1;
        opt.minValue = 0.0;
        opt.maxValue = 10.0;
        addOption(opt);

        var opt:Option = new Option(
            'Allow high scores',
            'If true => Allows saving scores on campaign and freeplay/individual songs.\nOnly applies when botplay is on.',
            'cpuAllowHighscores',
            'bool'
        );
        addOption(opt);

        super();
    }
}