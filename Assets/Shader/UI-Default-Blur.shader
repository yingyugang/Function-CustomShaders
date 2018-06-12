// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "UI/Default-Blur"
{
	Properties
	{
		[PerRendererData] _MainTex ("Sprite Texture", 2D) = "white" {}
		_Color ("Tint", Color) = (1,1,1,1)
		_StencilComp ("Stencil Comparison", Float) = 8
		_Stencil ("Stencil ID", Float) = 0
		_StencilOp ("Stencil Operation", Float) = 0
		_StencilWriteMask ("Stencil Write Mask", Float) = 255
		_StencilReadMask ("Stencil Read Mask", Float) = 255

		_ColorMask ("Color Mask", Float) = 15
		_BlurRangeX("Blur X",Range(0,1)) = 0.004
		_BlurRangeY("Blur Y",Range(0,1)) = 0.004
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
			float _BlurRangeX;
			float _BlurRangeY;

			fixed4 Blur(sampler2D tex, half2 uv, half2 addUv, half bias)
			{
				return 
					(
					tex2D(tex, uv + half2(addUv.x, addUv.y))
					+ tex2D(tex, uv + half2(-addUv.x, addUv.y))
					+ tex2D(tex, uv + half2(addUv.x, -addUv.y))
					+ tex2D(tex, uv + half2(-addUv.x, -addUv.y))
		
					+ tex2D(tex, uv + half2(addUv.x, 0))
					+ tex2D(tex, uv + half2(-addUv.x, 0))
					+ tex2D(tex, uv + half2(0, addUv.y))
					+ tex2D(tex, uv + half2(0, -addUv.y))
					)
					* bias / 2;
			}


			fixed4 Tex2DBlurring(sampler2D tex, half2 uv, half2 blur)
			{
				half4 color = tex2D(tex, uv);
				return color * 0.14387
					+ Blur( tex, uv, blur * 1, 0.06781 )
					+ Blur( tex, uv, blur * 2, 0.05791 )
					+ Blur( tex, uv, blur * 3, 0.04360 )
					+ Blur( tex, uv, blur * 4, 0.02773 )
					+ Blur( tex, uv, blur * 5, 0.01343 )
					+ Blur( tex, uv, blur * 6, 0.00353 );
			}

			v2f vert(appdata_t IN)
			{
				v2f OUT;
				OUT.worldPosition = IN.vertex;
				OUT.vertex = UnityObjectToClipPos(OUT.worldPosition);
				OUT.texcoord = IN.texcoord;
				OUT.color = IN.color ;
				return OUT;
			}

			sampler2D _MainTex;

			fixed4 frag(v2f IN) : SV_Target
			{
				//TODO need to set the blurX and blurY with scale.
				half4 color = Tex2DBlurring(_MainTex, IN.texcoord,half2(_BlurRangeX,_BlurRangeY));
				float3 tex_rgb = lerp(color.rgb,IN.color.rgb,IN.color.a);
				return float4(tex_rgb,color.a);
			}
		ENDCG
		}
	}
}
