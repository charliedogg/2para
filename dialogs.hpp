class tutorialDialog
{
	idd = 5000;
	movingenable = 0;
	
	class ControlsBackground{
		class TXT_background: RscText
		{
			idc = 1000;
			x = 0.295297 * safezoneW + safezoneX;
			y = 0.2305 * safezoneH + safezoneY;
			w = 0.407344 * safezoneW;
			h = 0.539 * safezoneH;
			colorBackground[] = {0,0,0,0.9};
			
		};
		class TXT_Textfield: RscEdit
		{
			access = 0;
			idc = 1001;
			text = ; //--- ToDo: Localize;
			x = 0.304062 * safezoneW + safezoneX;
			y = 0.247 * safezoneH + safezoneY;
			w = 0.391875 * safezoneW;
			h = 0.418 * safezoneH;
			colorBackground[] = {0.1,0.1,0.1,1};
		};
	};
	class controls {
		class TXT_Button: RscButton
		{
			idc = 1600;
			text = "CLOSE"; //--- ToDo: Localize;
			x = 0.479375 * safezoneW + safezoneX;
			y = 0.687 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.055 * safezoneH;
			colorBackground[] = {0.1,0.1,0.1,1};
			action = "closedialog 0";
		};
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT END
		////////////////////////////////////////////////////////
	};

};

/*class tutorialDialog
{
	idd = 5000;
	movingenable = 0;
	class BackgroundControls{

			////////////////////////////////////////////////////////
			// GUI EDITOR OUTPUT START (by Shepard, v1.063, #Sudiko)
			////////////////////////////////////////////////////////

			class TXTBTN_Background: RscText
			{
			idc = 1000;
			x = 0.432969 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.077 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
			};
	};
	class controls{
			class TXTBTN_Button: RscButton
			{
			idc = 1600;
			text = "CLOSE"; //--- ToDo: Localize;
			x = 0.474219 * safezoneW + safezoneX;
			y = 0.467 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.055 * safezoneH;
			colorActive[] = {1,1,0,1};
			};
			////////////////////////////////////////////////////////
			// GUI EDITOR OUTPUT END
			////////////////////////////////////////////////////////
	};
};*/