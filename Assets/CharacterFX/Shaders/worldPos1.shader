// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'

  Shader "Character/WorldPos1" {
    Properties {
      _Y("Y",Float) = 1.0
    }
    SubShader {
      Tags { "RenderType" = "Opaque" }
      CGPROGRAM
      #pragma target 3.0
      #pragma surface surf Lambert vertex:vert addshadow nolightmap
      struct Input {
          float3 worldPos;
          float3 localPos;
      };
      float _Y;
      void vert(inout appdata_full v, out Input o)    
      {
      	  o.localPos = v.vertex;
       	  o.worldPos = mul(unity_ObjectToWorld,v.vertex).xyz; 
      }
      
      void surf (Input IN, inout SurfaceOutput o) 
      {
      	float d = distance(IN.worldPos,IN.worldPos - IN.localPos + float3(0,0,0));
      	float d1 = frac(d *10 + _Y);
		if(d1 > 0.5 )
		{
	       o.Albedo = float3(1,0,0);   
		}
		else
		{
		  o.Albedo = float3(1,1,0);          
		}
      }
      ENDCG
    }
    Fallback "Disintegrate"
  }