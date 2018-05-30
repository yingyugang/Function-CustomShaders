// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "UI/Default-Blur"
{
	Properties
	{
		[PerRendererData] _MainTex ("Sprite Texture", 2D) = "white" {}
		_Size ("Blur", Range(0, 30)) = 1
		_StencilComp ("Stencil Comparison", Float) = 8
		_Stencil ("Stencil ID", Float) = 0
		_StencilOp ("Stencil Operation", Float) = 0
		_StencilWriteMask ("Stencil Write Mask", Float) = 255
		_StencilReadMask ("Stencil Read Mask", Float) = 255
		_ColorMask ("Color Mask", Float) = 15
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
				half2 uv  : TEXCOORD0;
				float4 worldPosition : TEXCOORD1;
			};
			
			fixed4 _TextureSampleAdd;
			float4 _ClipRect;
			float4 _MainTex_ST;
			v2f vert(appdata_t IN)
			{
				v2f OUT;
				OUT.worldPosition = IN.vertex;
				OUT.vertex = UnityObjectToClipPos(OUT.worldPosition);
				OUT.uv = IN.texcoord;
				#ifdef UNITY_HALF_TEXEL_OFFSET
				OUT.vertex.xy += (_ScreenParams.zw-1.0)*float2(-1,1);
				#endif
				OUT.color = IN.color ;
				return OUT;
			}

			sampler2D _MainTex;
			float4 _MainTex_TexelSize;
			float _Size;

			fixed4 frag(v2f i) : SV_Target
			{
			half4 sum = half4(0,0,0,0);
//			float depth = 1-i.depth.r*0.0005;
			float depth = 1;
			// gather pixel color from neighbours, distance to look for depends on camera distance..
			sum += tex2D(_MainTex, float2(i.uv.x - 5.0 * depth, i.uv.y - 5.0 * depth)) * 0.025;
			sum += tex2D(_MainTex, float2(i.uv.x - 4.0 * depth, i.uv.y - 4.0 * depth)) * 0.05;
			sum += tex2D(_MainTex, float2(i.uv.x - 3.0 * depth, i.uv.y - 3.0 * depth)) * 0.09;
			sum += tex2D(_MainTex, float2(i.uv.x - 2.0 * depth, i.uv.y - 2.0 * depth)) * 0.12;
			sum += tex2D(_MainTex, float2(i.uv.x - 1.0 * depth, i.uv.y - 1.0 * depth)) * 0.15;
			sum += tex2D(_MainTex, float2(i.uv.x, i.uv.y)) * 0.16;
			sum += tex2D(_MainTex, float2(i.uv.x + 1.0 * depth, i.uv.y + 1.0 * depth)) * 0.15;
			sum += tex2D(_MainTex, float2(i.uv.x + 2.0 * depth, i.uv.y + 2.0 * depth)) * 0.12;
			sum += tex2D(_MainTex, float2(i.uv.x + 3.0 * depth, i.uv.y + 3.0 * depth)) * 0.09;
			sum += tex2D(_MainTex, float2(i.uv.x + 4.0 * depth, i.uv.y + 4.0 * depth)) * 0.05;
			sum += tex2D(_MainTex, float2(i.uv.x + 5.0 * depth, i.uv.y + 5.0 * depth)) * 0.025;
			return sum;
			}
		ENDCG
		}
	}
}
