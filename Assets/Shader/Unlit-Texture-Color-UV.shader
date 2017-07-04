// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Unlit shader. Simplest possible textured shader.
// - no lighting
// - no lightmap support
// - no per-material color

Shader "Unlit/Texture-Color-UV" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
		_Color ("Main Color", Color) = (1,1,1,1)
		_x("x",Float) = 0
		_y("y",Float) = 0

	}

	SubShader {
		Tags { "RenderType"="Opaque" }
		LOD 100
		Pass {  
			CGPROGRAM
				#pragma vertex vert
				#pragma fragment frag
				#pragma multi_compile_fog
				
				#include "UnityCG.cginc"

				struct appdata_t {
					float4 vertex : POSITION;
					float2 texcoord : TEXCOORD0;
				};

				struct v2f {
					float4 vertex : SV_POSITION;
					half2 texcoord : TEXCOORD0;
					UNITY_FOG_COORDS(1)
				};

				sampler2D _MainTex;
				float4 _MainTex_ST;
				float4 _Color;
				float _x;
				float _y;
				v2f vert (appdata_t v)
				{
					v2f o;
					o.vertex = UnityObjectToClipPos(v.vertex);
					o.texcoord = TRANSFORM_TEX(v.texcoord, _MainTex);
					o.texcoord.y += _Time[1] * _y;
					o.texcoord.x += _Time[1] * _x;
					UNITY_TRANSFER_FOG(o,o.vertex);
					return o;
				}
				
				fixed4 frag (v2f i) : SV_Target
				{
					fixed4 col = tex2D(_MainTex, i.texcoord);
					//col.rgb += _Color.rgb * ((sin(_Time[1] * _T) + 1) / 2 + 0.2);
					//col = lerp(col,_Color,(sin(_Time * _T) + 1) / 2 + 0.2);
					//col = lerp(col,_Color,_Time - ceil(_Time));
					//UNITY_APPLY_FOG(i.fogCoord, col);
					//UNITY_OPAQUE_ALPHA(col.a);
					return col;
				}
			ENDCG
		}
	}
}
