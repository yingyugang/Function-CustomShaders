// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "2D/Dissovle_Texture"
{
	Properties
	{
		[PerRendererData] _MainTex ("Sprite Texture", 2D) = "white" {}
//_MainTex ("Sprite Texture", 2D) = "white" {}
		_NoiseTex ("Effect Map (RGB)", 2D) = "white" {}
      	_DisintegrateAmount ("Effect Amount", Range(0.0, 1.01)) = 0.0
      	_DissolveColor("Edge Color", Color) = (1.0,0.5,0.2,0.0)
      	_EdgeEmission ("Edge Emission", Color) = (0,0,0,0)
      	_DissolveEdge("Edge Range",Range(0.0,0.1)) = 0.01
      	_TileFactor ("Tile Factor", Range(0.0,10.0)) = 1.0
		_ColorMask ("Color Mask", Float) = 15
		_Y ("Y",FLOAT) = 0.01
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
		Fog { Mode Off }
		Blend SrcAlpha OneMinusSrcAlpha
		ColorMask [_ColorMask]
 
		Pass
		{
		CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			#include "UnityCG.cginc"


			struct appdata_t
			{
				float4 vertex   : POSITION;
				float4 color    : COLOR;
				float2 texcoord : TEXCOORD0;
			};
 
			struct v2f
			{
				float4 vertex   : SV_POSITION;
				float2 vertex1  : TEXCOORD1;
				fixed4 color    : COLOR;
				half2 texcoord  : TEXCOORD0;
			};
			
			sampler2D _MainTex;
			sampler2D _NoiseTex;
			float  _DisintegrateAmount;
      		float4 _DissolveColor;
      		float  _DissolveEdge;
      		float  _TileFactor;
      		float4 _EdgeEmission;  
      		float _Y;

			v2f vert(appdata_t IN)
			{
				v2f OUT;

//				if( abs(IN.vertex.y * 100) % 2 > 0 && abs(IN.vertex.y * 100) % 2 <=1){
//					IN.vertex.x += 1000;
//				}else{
//					IN.vertex.x -= 1000;
//				}
				
				OUT.vertex = UnityObjectToClipPos(IN.vertex);
				OUT.vertex1 = IN.vertex.xy;
				OUT.texcoord = IN.texcoord;
//				#ifdef UNITY_HALF_TEXEL_OFFSET
//				OUT.vertex.xy += (_ScreenParams.zw-1.0)*float2(-1,1);
//				#endif
//					OUT.vertex.x += 10 * _DisintegrateAmount;

				OUT.color = IN.color;
				return OUT;
			}
			fixed4 frag(v2f IN) : SV_Target
			{
				float4 noise_c = tex2D (_NoiseTex, IN.texcoord * _TileFactor);


				int y = (int)IN.vertex.x ;

//				if((int)(abs(IN.vertex.y * 100)) % 2 == 0){
//					discard;
//				}else{
//					
//				}

//				float clipval = noise_c.rgb - _DisintegrateAmount;
//				clip(clipval);
				float4 c = tex2D (_MainTex, IN.texcoord);
//	     		if (clipval < _DissolveEdge && _DisintegrateAmount > 0)
//	      		{
//	      			if(clipval < _DissolveEdge/2){
//	          			c.rgb =  _EdgeEmission.rgb;
//	          			c.a = c.a * _EdgeEmission.a; 
//	      			}else{
//	          			c.rgb =  _DissolveColor.rgb;
//	          			c.a = c.a * _DissolveColor.a; 
//	      			}        
//	      		}      
				if(y % 4 <= _Y){
				discard;
								}
			
   
          		return c;
			}
		ENDCG
		}
	}
}