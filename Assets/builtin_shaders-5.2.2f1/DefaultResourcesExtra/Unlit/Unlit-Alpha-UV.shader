// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Unlit alpha-blended shader.
// - no lighting
// - no lightmap support
// - no per-material color

Shader "Unlit/Transparent-UV" {
Properties {
	_MainTex ("Base (RGB) Trans (A)", 2D) = "white" {}
	    _U ("U", Float ) = 1
        _V ("V", Float ) = 0
}

SubShader {
	Tags {"Queue"="Transparent" "IgnoreProjector"="True" "RenderType"="Transparent"}
	LOD 100
	
	ZWrite Off
	Blend SrcAlpha OneMinusSrcAlpha 
	
	Pass {  
		CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			//#pragma multi_compile_fog
			
			#include "UnityCG.cginc"

			struct appdata_t {
				float4 vertex : POSITION;
				float2 texcoord : TEXCOORD0;
			};

			struct v2f {
				float4 vertex : SV_POSITION;
				half2 uv0 : TEXCOORD0;
				//UNITY_FOG_COORDS(1)
			};

			sampler2D _MainTex;
			float4 _MainTex_ST;
			uniform float4 _TimeEditor;
			uniform fixed _U;
            uniform fixed _V;
			v2f vert (appdata_t v)
			{
				v2f o;
				o.vertex = UnityObjectToClipPos(v.vertex);
				o.uv0 = TRANSFORM_TEX(v.texcoord, _MainTex);
				//UNITY_TRANSFER_FOG(o,o.vertex);
				return o;
			}
			
			fixed4 frag (v2f i) : SV_Target
			{
				fixed4 time = _Time + _TimeEditor;
                float2 add = (i.uv0+(float2(_U,_V)*time.g));
                fixed4 _mainTex_var = tex2D(_MainTex,TRANSFORM_TEX(add, _MainTex)) ;

				//fixed4 col = tex2D(_MainTex, i.texcoord);
				//UNITY_APPLY_FOG(i.fogCoord, col);
				return _mainTex_var;
			}
		ENDCG
	}
}

}
