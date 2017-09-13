Shader "Custom/Cameo" {  
    Properties {  
        [PerRendererData] _MainTex ("Base (RGB) Trans (A)", 2D) = "white" {}
        _Color("Main Color",color)=(1,1,1,1)  
    }  
    SubShader { 

            Tags {"Queue"="Transparent" "IgnoreProjector"="True" "RenderType"="Transparent"}
        LOD 200
		Cull Off Lighting Off ZWrite Off Fog { Color (0,0,0,0) }
		Blend SrcAlpha One
		AlphaTest Greater .01
		ColorMask RGB

        CGPROGRAM
        #pragma surface surf Lambert alpha

        sampler2D _MainTex;
        float2 _MainTex_TexelSize;
        float4 _Color;
        struct Input {
            float2 uv_MainTex;
        };

        void surf (Input IN, inout SurfaceOutput o) {
			float2  upLeftUV = float2(IN.uv_MainTex.x - 1.0/_MainTex_TexelSize.x , IN.uv_MainTex.y - 1.0/_MainTex_TexelSize.y);
		  	float4  bkColor = _Color;
		   	float4  curColor    =  tex2D( _MainTex, IN.uv_MainTex );
		   	float4  upLeftColor =  tex2D( _MainTex, upLeftUV );
		   	//相减得到颜色的差
		   	float4  delColor = curColor - upLeftColor;
		   	//需要把这个颜色的差设置
		   	float  h = 0.3 * delColor.x + 0.59 * delColor.y + 0.11* delColor.z;
		   	float4  _outColor =  float4(h,h,h,0.0)+ bkColor;
		   	o.Albedo = _outColor.xyz;
			o.Alpha = curColor.a;
        }

        ENDCG
    }   
}  