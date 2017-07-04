// Simplified Diffuse shader. Differences from regular Diffuse one:
// - no Main Color
// - fully supports only 1 directional light. Other lights can affect it, but it will be per-vertex/SH.

Shader "Mobile/Diffuse With VertexColor" {
	Properties {
		_MainTex ("Base (RGB)", 2D) = "white" {}
	}
	SubShader {
		Tags { "RenderType"="Opaque" }
		LOD 150

	CGPROGRAM
	#pragma surface surf Lambert  vertex:myvert noforwardadd

	sampler2D _MainTex;

	struct Input {
		float2 uv_MainTex;
		float4 color;
	};

	void myvert (inout appdata_full v, out Input data)
	{
	  	data.uv_MainTex = v.texcoord.xy;
	    data.color = v.color;
	}

	void surf (Input IN, inout SurfaceOutput o) {
		fixed4 c = tex2D(_MainTex, IN.uv_MainTex);
		o.Albedo = c.rgb * IN.color.rgb;
		o.Alpha = c.a;
	}
	ENDCG
	}
Fallback "Mobile/VertexLit"
}
