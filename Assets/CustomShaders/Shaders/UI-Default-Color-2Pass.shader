// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "UI/Default-Color-2Pass"
{
	Properties
	{
		[PerRendererData] _MainTex ("Sprite Texture", 2D) = "white" {}
		_MaskTex("Mask Texture", 2D) = "white"{}
		t("radio", Float) = 0
		_Color ("Tint", Color) = (1,1,1,1)
		_ColorMask ("Color Mask", Float) = 15
		_TileFactor("Tile",Float) = 1
		_Amount ("Amount", Range(0.0, 1.01)) = 0.0
		[Toggle(UNITY_UI_ALPHACLIP)] _UseUIAlphaClip ("Use Alpha Clip", Float) = 0
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
			float t;
			float _TileFactor;
			float _Amount;

			v2f vert(appdata_t IN)
			{
				v2f OUT;
				OUT.worldPosition = IN.vertex;
				OUT.vertex = UnityObjectToClipPos(OUT.worldPosition);
				OUT.vertex = float4(OUT.vertex.xyz * 1,OUT.vertex.w);
				OUT.texcoord = IN.texcoord;
				OUT.color = IN.color * _Color;
				return OUT;
			}

			sampler2D _MainTex;
			sampler2D _MaskTex;

			fixed4 frag(v2f IN) : SV_Target
			{
				half4 color = tex2D(_MainTex, IN.texcoord) ;
				half4 noise_c = tex2D (_MaskTex, IN.texcoord * _TileFactor);
				float alpha = noise_c.rgb - _Amount + 0.1;
				color.xyz = lerp(color.xyz,_Color.xyz,t);
				color.a *= _Color.a;
				color.a *= alpha;
				return color;
			}
		ENDCG
		}


//		Pass
//		{
//		CGPROGRAM
//			#pragma vertex vert
//			#pragma fragment frag
//
//			#include "UnityCG.cginc"
//			#include "UnityUI.cginc"
//
//			#pragma multi_compile __ UNITY_UI_ALPHACLIP
//			
//			struct appdata_t
//			{
//				float4 vertex   : POSITION;
//				float4 color    : COLOR;
//				float2 texcoord : TEXCOORD0;
//			};
//
//			struct v2f
//			{
//				float4 vertex   : SV_POSITION;
//				fixed4 color    : COLOR;
//				half2 texcoord  : TEXCOORD0;
//				float4 worldPosition : TEXCOORD1;
//			};
//			
//			fixed4 _Color;
//			fixed4 _TextureSampleAdd;
//			float4 _ClipRect;
//			float t;
//
//			v2f vert(appdata_t IN)
//			{
//				float p = 0.1;
//				v2f OUT;
//				OUT.worldPosition = IN.vertex;
//				OUT.vertex = mul(UNITY_MATRIX_MVP, OUT.worldPosition);
//				OUT.vertex = float4(OUT.vertex.xyz * 1.1,OUT.vertex.w);
//				OUT.texcoord = IN.texcoord;
//				OUT.color = IN.color * _Color;
//				return OUT;
//			}
//
//			sampler2D _MainTex;
//
//			fixed4 frag(v2f IN) : SV_Target
//			{
//				half4 color = tex2D(_MainTex, IN.texcoord) ;
//				color.xyz = lerp(color.xyz,_Color.xyz,t);
//				float a = IN.worldPosition.y / 10;
//				color.w *= a;
//				return color;
//			}
//		ENDCG
//		}
//
//				Pass
//		{
//		CGPROGRAM
//			#pragma vertex vert
//			#pragma fragment frag
//
//			#include "UnityCG.cginc"
//			#include "UnityUI.cginc"
//
//			#pragma multi_compile __ UNITY_UI_ALPHACLIP
//			
//			struct appdata_t
//			{
//				float4 vertex   : POSITION;
//				float4 color    : COLOR;
//				float2 texcoord : TEXCOORD0;
//			};
//
//			struct v2f
//			{
//				float4 vertex   : SV_POSITION;
//				fixed4 color    : COLOR;
//				half2 texcoord  : TEXCOORD0;
//				float4 worldPosition : TEXCOORD1;
//			};
//			
//			fixed4 _Color;
//			fixed4 _TextureSampleAdd;
//			float4 _ClipRect;
//			float t;
//
//			v2f vert(appdata_t IN)
//			{
//				float p = 0.1;
//				v2f OUT;
//				OUT.worldPosition = IN.vertex;
//				OUT.vertex = mul(UNITY_MATRIX_MVP, OUT.worldPosition);
//				OUT.vertex = float4(OUT.vertex.xyz * 1.2,OUT.vertex.w);
//				OUT.texcoord = IN.texcoord;
//				OUT.color = IN.color * _Color;
//				return OUT;
//			}
//
//			sampler2D _MainTex;
//
//			fixed4 frag(v2f IN) : SV_Target
//			{
//				half4 color = tex2D(_MainTex, IN.texcoord) ;
//				color.xyz = lerp(color.xyz,_Color.xyz,t);
//				color.w *= 1;
//				return color;
//			}
//		ENDCG
//		}


	}
}
