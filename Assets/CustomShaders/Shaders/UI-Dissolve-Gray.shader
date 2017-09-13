// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "UI/Dissovle-Default-Gray"
{
	Properties
	{
		[PerRendererData] _MainTex ("Sprite Texture", 2D) = "white" {}
		_NoiseTex ("Effect Map (RGB)", 2D) = "white" {}
      	_DisintegrateAmount ("Effect Amount", Range(0.0, 1.01)) = 0.0
      	_DissolveColor("Edge Color", Color) = (1.0,0.5,0.2,0.0)
      	_EdgeEmission ("Edge Emission", Color) = (0,0,0,0)
      	_DissolveEdge("Edge Range",Range(0.0,0.1)) = 0.01
      	_TileFactor ("Tile Factor", Range(0.0,10.0)) = 1.0
		_ColorMask ("Color Mask", Float) = 15
	}

	SubShader
	{
		Tags
		{ 
			"Queue"="Transparent" 
			"IgnoreProjector"="True" 
			"RenderType"="Transparent" 
			"PreviewType"="Plane"
			"CanUseSpriteAtlas"="True"
		}
		
		Stencil
		{
			Ref [_Stencil]
			Comp [_StencilComp]
			Pass [_StencilOp] 
			ReadMask [_StencilReadMask]
			WriteMask [_StencilWriteMask]
		}

		Cull Off
		Lighting Off
		ZWrite Off
		ZTest [unity_GUIZTestMode]
		Blend SrcAlpha OneMinusSrcAlpha
		ColorMask [_ColorMask]

		Pass
		{
		CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag

			#include "UnityCG.cginc"
			#include "UnityUI.cginc"

			#pragma multi_compile __ UNITY_UI_ALPHACLIP
			
			struct appdata_t
			{
				float4 vertex   : POSITION;
				float4 color    : COLOR;
				float2 texcoord : TEXCOORD0;
			};

			struct v2f
			{
				float4 vertex   : SV_POSITION;
				fixed4 color    : COLOR;
				half2 texcoord  : TEXCOORD0;
				float4 worldPosition : TEXCOORD1;
			};
			
			fixed4 _Color;
			fixed4 _TextureSampleAdd;
			float4 _ClipRect;
			sampler2D _MainTex;
			sampler2D _NoiseTex;
			float  _DisintegrateAmount;
      		float4 _DissolveColor;
      		float  _DissolveEdge;
      		float  _TileFactor;
      		float4 _EdgeEmission;  


			v2f vert(appdata_t IN)
			{
				v2f OUT;
				OUT.worldPosition = IN.vertex;
				OUT.vertex = UnityObjectToClipPos(OUT.worldPosition);

				OUT.texcoord = IN.texcoord;
				
				#ifdef UNITY_HALF_TEXEL_OFFSET
				OUT.vertex.xy += (_ScreenParams.zw-1.0)*float2(-1,1);
				#endif
				
				OUT.color = IN.color * _Color;
				return OUT;
			}

			fixed4 frag(v2f IN) : SV_Target
			{
				half4 color = (tex2D(_MainTex, IN.texcoord) + _TextureSampleAdd) * IN.color;
				color.a *= UnityGet2DClipping(IN.worldPosition.xy, _ClipRect);
				float4 noise_c = tex2D (_NoiseTex, IN.texcoord * _TileFactor);
				float clipval = noise_c.rgb - _DisintegrateAmount;
				float4 c = tex2D (_MainTex, IN.texcoord);
//				if(clipval<=0){

				if(clipval<0){
					float grey = dot(c.rgb, fixed3(0.22, 0.707, 0.071));
					c = half4(grey, grey, grey, c.a);
				}else if (clipval < _DissolveEdge && _DisintegrateAmount > 0){
	      			if(clipval < _DissolveEdge/2){
	          			c.rgb =  _EdgeEmission.rgb;
	          			c.a = c.a * _EdgeEmission.a; 
	      			}else{
	          			c.rgb =  _DissolveColor.rgb;
	          			c.a = c.a * _DissolveColor.a; 
	      			}        
	      		}else{
	      			
	      		}    
				#ifdef UNITY_UI_ALPHACLIP
				clip (color.a - 0.001);
				#endif
				return c;
			}
		ENDCG
		}
	}
}
