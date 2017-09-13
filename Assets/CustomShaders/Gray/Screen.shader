Shader "Custom-Screen" {
    Properties {
        _MainTex ("Base (RGB) Trans (A)", 2D) = "white" {}
        _Color("Color", Color) = (1.0,0.5,0.2,0.0)
        _Action("Action",Range(0,2)) = 0.05
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
            float _Action;
            float4 _Color;
            struct Input {
                float2 uv_MainTex;
            };

            void surf (Input IN, inout SurfaceOutput o) {
                half4 c = tex2D(_MainTex, IN.uv_MainTex);
                
// 				o.Albedo = dot(c.rgb, float3(0.3, 0.59, 0.11)) + 252.0;
//				fixed grayscale = Luminance(c.rgb);
//				o.Albedo = grayscale * 0.3 + 2.0;
				
//				o.Alpha = (c.a * (c.r+c.g+c.b)/3);
				float grey = dot(c.rgb, fixed3(0.22, 0.707, 0.071));
//				float grey = 0.3 * (c.x + _Color.x * max(0,_Action)) + 0.59 * (c.y+ _Color.y * max(0,_Action)) + 0.11* (c.z + _Color.z * max(0,_Action));
//				o.Albedo = float3(grey,grey,grey);
				o.Albedo = float3(c.x+grey,c.y+grey,c.z+grey) * grey + _Color * (1-grey) * max(0,_Action); //_Action ;
//				o.Albedo = float3(c.x+grey,c.y+grey,c.z+grey) * (1 - grey) + _Color * grey * max(0,_Action);
//				o.Albedo = float3(c.x,c.y,c.z) * (1-grey);
//				if(grey>0.5)
//					o.Albedo = float3(c.x,c.y,c.z) * abs(1 + _Action * grey);
//				else
//					o.Albedo = float3(c.x,c.y,c.z) * abs(1 - _Action * grey);
//				else
//					o.Albedo = float3(c.x,c.y,c.z) / 2;
				//o.Albedo = float3(grey,grey,grey);
				o.Alpha = c.a;
//				return half4(grey, grey, grey, color.a);


            }

        ENDCG
    }

    Fallback "Transparent/VertexLit"
}
