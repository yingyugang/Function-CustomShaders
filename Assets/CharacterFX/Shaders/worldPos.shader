// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'

  Shader "Character/WorldPos" {
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
      };
      float _Y;
      void vert(inout appdata_full v, out Input o)    
      {
       	  o.worldPos = mul(unity_ObjectToWorld,v.vertex).xyz; 
      }
      
      void surf (Input IN, inout SurfaceOutput o) 
      {
		if(IN.worldPos.y > _Y && IN.worldPos.y < _Y + 0.2)
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