// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Shader created with Shader Forge v1.16 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.16;sub:START;pass:START;ps:flbk:Mobile/Particles/Additive,iptp:0,cusa:False,bamd:0,lico:0,lgpr:1,limd:3,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:True,rprd:False,enco:False,rmgx:True,rpth:0,hqsc:True,nrmq:0,nrsp:0,vomd:0,spxs:False,tesm:0,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:3138,x:32937,y:32186,varname:node_3138,prsc:2|emission-3718-RGB;n:type:ShaderForge.SFN_Tex2d,id:3718,x:32689,y:32258,ptovrint:False,ptlb:mainTex,ptin:_mainTex,varname:_mainTex,prsc:0,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:f2cef4bf65222c24f86793b6d7fb346d,ntxv:0,isnm:False|UVIN-5055-OUT;n:type:ShaderForge.SFN_VertexColor,id:954,x:32689,y:32507,varname:node_954,prsc:2;n:type:ShaderForge.SFN_ValueProperty,id:9782,x:31874,y:32318,ptovrint:False,ptlb:U,ptin:_U,varname:_U,prsc:0,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_ValueProperty,id:3029,x:31874,y:32442,ptovrint:False,ptlb:V,ptin:_V,varname:_V,prsc:0,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0;n:type:ShaderForge.SFN_Append,id:4930,x:32106,y:32274,varname:node_4930,prsc:0|A-9782-OUT,B-3029-OUT;n:type:ShaderForge.SFN_TexCoord,id:5277,x:32312,y:32162,varname:node_5277,prsc:2,uv:0;n:type:ShaderForge.SFN_Add,id:5055,x:32484,y:32258,varname:add,prsc:2|A-5277-UVOUT,B-4237-OUT;n:type:ShaderForge.SFN_Time,id:189,x:32106,y:32453,varname:time,prsc:0;n:type:ShaderForge.SFN_Multiply,id:4237,x:32312,y:32318,varname:node_4237,prsc:2|A-4930-OUT,B-189-T;proporder:3718-9782-3029;pass:END;sub:END;*/

Shader "RGS/texPan_value" {
    Properties {
        _mainTex ("mainTex", 2D) = "white" {}
        _U ("U", Float ) = 1
        _V ("V", Float ) = 0
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #include "UnityPBSLighting.cginc"
            #include "UnityStandardBRDF.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma exclude_renderers gles3 d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform float4 _TimeEditor;
            uniform sampler2D _mainTex; uniform float4 _mainTex_ST;
            uniform fixed _U;
            uniform fixed _V;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.pos = UnityObjectToClipPos(v.vertex);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
/////// Vectors:
////// Lighting:
////// Emissive:
                fixed4 time = _Time + _TimeEditor;
                float2 add = (i.uv0+(float2(_U,_V)*time.g));
                fixed4 _mainTex_var = tex2D(_mainTex,TRANSFORM_TEX(add, _mainTex));
                float3 emissive = _mainTex_var.rgb;
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
    }
    FallBack "Mobile/Particles/Additive"
    CustomEditor "ShaderForgeMaterialInspector"
}
