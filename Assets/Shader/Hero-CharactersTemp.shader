// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'

// Shader created with Shader Forge v1.30 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.30;sub:START;pass:START;ps:flbk:Unlit/Texture,iptp:0,cusa:False,bamd:0,lico:0,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:False,mssp:False,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:2,rntp:3,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:4013,x:33514,y:32506,varname:node_4013,prsc:2|diff-4877-OUT,diffpow-4877-OUT,spec-8835-OUT,emission-215-OUT,amdfl-3051-OUT,amspl-784-OUT,custl-2626-OUT,clip-2937-OUT,olwid-9521-OUT,olcol-2040-RGB;n:type:ShaderForge.SFN_Tex2d,id:7907,x:30305,y:32017,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:_MainTex,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Slider,id:6358,x:29747,y:31723,ptovrint:False,ptlb:AlphaRange,ptin:_AlphaRange,varname:_AlphaRange,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0.6,cur:0.8374977,max:1;n:type:ShaderForge.SFN_Vector1,id:3445,x:29825,y:31937,varname:node_3445,prsc:2,v1:1;n:type:ShaderForge.SFN_Subtract,id:7540,x:30343,y:31722,varname:node_7540,prsc:2|A-6736-OUT,B-3445-OUT;n:type:ShaderForge.SFN_Multiply,id:6736,x:30111,y:31770,varname:node_6736,prsc:2|A-6358-OUT,B-3445-OUT;n:type:ShaderForge.SFN_Subtract,id:9690,x:30547,y:31833,varname:node_9690,prsc:2|A-7907-A,B-7540-OUT;n:type:ShaderForge.SFN_Multiply,id:9265,x:30730,y:31796,varname:node_9265,prsc:2|A-9690-OUT,B-3445-OUT;n:type:ShaderForge.SFN_NormalVector,id:5801,x:30812,y:32441,prsc:2,pt:True;n:type:ShaderForge.SFN_Lerp,id:3051,x:32038,y:32234,varname:node_3051,prsc:2|A-4203-RGB,B-595-RGB,T-3348-OUT;n:type:ShaderForge.SFN_Dot,id:6446,x:31351,y:32513,varname:node_6446,prsc:2,dt:1|A-5801-OUT,B-2492-RGB;n:type:ShaderForge.SFN_Color,id:4203,x:31326,y:32085,ptovrint:False,ptlb:FrontColor,ptin:_FrontColor,varname:_FrontColor,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.8718101,c2:0.8916488,c3:0.9191176,c4:1;n:type:ShaderForge.SFN_Color,id:595,x:31339,y:32308,ptovrint:False,ptlb:BackColor,ptin:_BackColor,varname:_BackColor,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.4980392,c2:0.4705883,c3:0.427451,c4:1;n:type:ShaderForge.SFN_Color,id:1924,x:30545,y:32248,ptovrint:False,ptlb:Color,ptin:_Color,varname:_Color,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Multiply,id:2601,x:32159,y:32031,varname:node_2601,prsc:2|A-7907-RGB,B-1924-RGB;n:type:ShaderForge.SFN_Slider,id:8710,x:31635,y:33036,ptovrint:False,ptlb:EmissPower,ptin:_EmissPower,varname:_EmissPower,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Color,id:342,x:32006,y:32902,ptovrint:False,ptlb:EmissColor,ptin:_EmissColor,varname:_EmissColor,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Multiply,id:946,x:32213,y:32861,varname:node_946,prsc:2|A-342-RGB,B-8710-OUT;n:type:ShaderForge.SFN_Multiply,id:215,x:32662,y:32858,varname:node_215,prsc:2|A-1924-RGB,B-946-OUT;n:type:ShaderForge.SFN_Color,id:2040,x:31506,y:32800,ptovrint:False,ptlb:OutlineColor,ptin:_OutlineColor,varname:_OutlineColor,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.06082395,c2:0.0898237,c3:0.1102941,c4:1;n:type:ShaderForge.SFN_Slider,id:5402,x:31295,y:33133,ptovrint:False,ptlb:OutlineSize,ptin:_OutlineSize,varname:_OutlineSize,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.1067961,max:2;n:type:ShaderForge.SFN_FragmentPosition,id:9071,x:30598,y:33188,varname:node_9071,prsc:2;n:type:ShaderForge.SFN_ViewPosition,id:1643,x:30598,y:33332,varname:node_1643,prsc:2;n:type:ShaderForge.SFN_Distance,id:6254,x:30784,y:33263,varname:node_6254,prsc:2|A-9071-XYZ,B-1643-XYZ;n:type:ShaderForge.SFN_ProjectionParameters,id:4502,x:30784,y:33413,varname:node_4502,prsc:2;n:type:ShaderForge.SFN_Subtract,id:4725,x:30977,y:33263,varname:node_4725,prsc:2|A-6254-OUT,B-4502-NEAR;n:type:ShaderForge.SFN_Divide,id:10,x:31176,y:33263,varname:node_10,prsc:2|A-4725-OUT,B-1244-OUT;n:type:ShaderForge.SFN_Vector1,id:1244,x:30994,y:33447,varname:node_1244,prsc:2,v1:150;n:type:ShaderForge.SFN_Clamp01,id:1852,x:31350,y:33263,varname:node_1852,prsc:2|IN-10-OUT;n:type:ShaderForge.SFN_Multiply,id:3053,x:31540,y:33263,varname:node_3053,prsc:2|A-1852-OUT,B-5402-OUT;n:type:ShaderForge.SFN_Min,id:9521,x:31732,y:33263,varname:node_9521,prsc:2|A-3053-OUT,B-750-OUT;n:type:ShaderForge.SFN_Vector1,id:750,x:31577,y:33452,varname:node_750,prsc:2,v1:1;n:type:ShaderForge.SFN_If,id:2937,x:31188,y:31347,varname:node_2937,prsc:2|A-5132-OUT,B-7906-OUT,GT-6679-OUT,EQ-6679-OUT,LT-9265-OUT;n:type:ShaderForge.SFN_Slider,id:5132,x:29982,y:30824,ptovrint:False,ptlb:Amout,ptin:_Amout,varname:_Amout,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:1;n:type:ShaderForge.SFN_Vector1,id:6679,x:30139,y:31012,varname:node_6679,prsc:2,v1:0;n:type:ShaderForge.SFN_Tex2dAsset,id:152,x:29814,y:31025,ptovrint:False,ptlb:DissolvSrc,ptin:_DissolvSrc,varname:_DissolvSrc,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:28c7aad1372ff114b90d330f8a2dd938,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:5789,x:30114,y:31268,varname:node_5789,prsc:2,tex:28c7aad1372ff114b90d330f8a2dd938,ntxv:0,isnm:False|TEX-152-TEX;n:type:ShaderForge.SFN_Power,id:7906,x:30327,y:31450,varname:node_7906,prsc:2|VAL-5789-R,EXP-844-OUT;n:type:ShaderForge.SFN_Vector1,id:844,x:30088,y:31484,varname:node_844,prsc:2,v1:1;n:type:ShaderForge.SFN_Multiply,id:9926,x:32191,y:31668,varname:node_9926,prsc:2|A-2016-OUT,B-3024-RGB;n:type:ShaderForge.SFN_Multiply,id:2016,x:32028,y:31668,varname:node_2016,prsc:2|A-4289-OUT,B-6632-OUT;n:type:ShaderForge.SFN_Fresnel,id:4289,x:31801,y:31479,varname:node_4289,prsc:2|EXP-9226-OUT;n:type:ShaderForge.SFN_Slider,id:6632,x:31554,y:31760,ptovrint:False,ptlb:RimRange,ptin:_RimRange,varname:_RimRange,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.2606722,max:2;n:type:ShaderForge.SFN_Color,id:3024,x:31998,y:31819,ptovrint:False,ptlb:RimColor,ptin:_RimColor,varname:_RimColor,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Add,id:4877,x:32600,y:31983,varname:node_4877,prsc:2|A-9926-OUT,B-2601-OUT;n:type:ShaderForge.SFN_Vector1,id:9226,x:31554,y:31542,varname:node_9226,prsc:2,v1:1.5;n:type:ShaderForge.SFN_Vector3,id:3306,x:29130,y:33050,varname:node_3306,prsc:2,v1:0.07,v2:0.07,v3:0.07;n:type:ShaderForge.SFN_Multiply,id:784,x:32347,y:32630,varname:node_784,prsc:2|A-3306-OUT,B-4011-OUT,C-8293-R;n:type:ShaderForge.SFN_Multiply,id:8835,x:32865,y:32600,varname:node_8835,prsc:2|A-7907-RGB,B-784-OUT;n:type:ShaderForge.SFN_Tex2d,id:8293,x:30058,y:34135,ptovrint:False,ptlb:Matcap,ptin:_Matcap,varname:_Matcap,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-1320-OUT;n:type:ShaderForge.SFN_RemapRange,id:1320,x:29842,y:34123,varname:node_1320,prsc:2,frmn:-1,frmx:1,tomn:0,tomx:1|IN-9568-OUT;n:type:ShaderForge.SFN_ComponentMask,id:9568,x:29663,y:34123,varname:node_9568,prsc:2,cc1:0,cc2:1,cc3:-1,cc4:-1|IN-4147-XYZ;n:type:ShaderForge.SFN_Transform,id:4147,x:29463,y:34123,varname:node_4147,prsc:2,tffrom:0,tfto:3|IN-6246-OUT;n:type:ShaderForge.SFN_NormalVector,id:6246,x:29248,y:34123,prsc:2,pt:True;n:type:ShaderForge.SFN_Slider,id:5410,x:27098,y:33224,ptovrint:False,ptlb:TopLight,ptin:_TopLight,varname:_TopLight,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:2.017328,max:3;n:type:ShaderForge.SFN_RemapRange,id:8292,x:27469,y:33198,varname:node_8292,prsc:2,frmn:0,frmx:2,tomn:-1,tomx:1|IN-5410-OUT;n:type:ShaderForge.SFN_Vector1,id:5170,x:27594,y:33494,varname:node_5170,prsc:2,v1:5;n:type:ShaderForge.SFN_Vector1,id:5926,x:27783,y:33474,varname:node_5926,prsc:2,v1:2;n:type:ShaderForge.SFN_Power,id:7305,x:28016,y:33300,varname:node_7305,prsc:2|VAL-8055-OUT,EXP-5170-OUT;n:type:ShaderForge.SFN_Fresnel,id:9057,x:28045,y:33470,varname:node_9057,prsc:2|EXP-5926-OUT;n:type:ShaderForge.SFN_Multiply,id:2619,x:28394,y:33636,varname:node_2619,prsc:2|A-7305-OUT,B-1420-OUT;n:type:ShaderForge.SFN_Power,id:541,x:28258,y:33771,varname:node_541,prsc:2|VAL-9057-OUT,EXP-5170-OUT;n:type:ShaderForge.SFN_Multiply,id:8578,x:28436,y:33809,varname:node_8578,prsc:2|A-541-OUT,B-3161-OUT;n:type:ShaderForge.SFN_Vector1,id:3161,x:28085,y:33959,varname:node_3161,prsc:2,v1:2;n:type:ShaderForge.SFN_Add,id:2861,x:28706,y:33704,varname:node_2861,prsc:2|A-2619-OUT,B-8578-OUT;n:type:ShaderForge.SFN_Multiply,id:4011,x:28976,y:33516,varname:node_4011,prsc:2|A-4532-OUT,B-2861-OUT;n:type:ShaderForge.SFN_Vector3,id:4532,x:28443,y:33250,varname:node_4532,prsc:2,v1:0.05882353,v2:0.05882353,v3:0.05882353;n:type:ShaderForge.SFN_Slider,id:1420,x:27532,y:34044,ptovrint:False,ptlb:TopLightPower,ptin:_TopLightPower,varname:_TopLightPower,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:5,max:8;n:type:ShaderForge.SFN_Vector1,id:2128,x:27369,y:33539,varname:node_2128,prsc:2,v1:1;n:type:ShaderForge.SFN_Add,id:8055,x:27835,y:33267,varname:node_8055,prsc:2|A-8292-OUT,B-2128-OUT;n:type:ShaderForge.SFN_SwitchProperty,id:5658,x:32587,y:33152,ptovrint:False,ptlb:Outline,ptin:_Outline,varname:_Outline,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:False|A-5167-OUT,B-9343-OUT;n:type:ShaderForge.SFN_Vector1,id:9343,x:32377,y:33238,varname:node_9343,prsc:2,v1:0.01;n:type:ShaderForge.SFN_Vector1,id:5167,x:32413,y:33363,varname:node_5167,prsc:2,v1:0;n:type:ShaderForge.SFN_Multiply,id:9905,x:32904,y:32235,varname:node_9905,prsc:2|A-4877-OUT,B-6257-OUT,C-6821-OUT;n:type:ShaderForge.SFN_Add,id:2626,x:33183,y:32593,varname:node_2626,prsc:2|A-9905-OUT,B-8835-OUT;n:type:ShaderForge.SFN_Color,id:2492,x:30812,y:32635,ptovrint:False,ptlb:AmbientLight,ptin:_AmbientLight,varname:_AmbientLight,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:0.5;n:type:ShaderForge.SFN_Add,id:6257,x:32365,y:32422,varname:node_6257,prsc:2|A-3051-OUT,B-2492-A;n:type:ShaderForge.SFN_Slider,id:8806,x:27881,y:32549,ptovrint:False,ptlb:Shadowlevel,ptin:_Shadowlevel,varname:_Shadowlevel,prsc:0,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:-2,cur:0,max:1.07;n:type:ShaderForge.SFN_RemapRange,id:6351,x:28241,y:32490,varname:node_6351,prsc:2,frmn:0,frmx:1,tomn:-1,tomx:1|IN-8806-OUT;n:type:ShaderForge.SFN_Add,id:9169,x:28535,y:32290,varname:node_9169,prsc:2|A-7525-Y,B-6351-OUT;n:type:ShaderForge.SFN_FragmentPosition,id:7525,x:27955,y:32180,varname:node_7525,prsc:2;n:type:ShaderForge.SFN_Vector1,id:1152,x:28595,y:32595,varname:node_1152,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Lerp,id:6821,x:30167,y:32394,varname:node_6821,prsc:2|A-710-RGB,B-5761-OUT,T-7792-OUT;n:type:ShaderForge.SFN_Vector1,id:5761,x:29768,y:32696,varname:node_5761,prsc:2,v1:1;n:type:ShaderForge.SFN_Multiply,id:7792,x:29383,y:32290,varname:node_7792,prsc:2|A-9496-OUT,B-2586-OUT;n:type:ShaderForge.SFN_Vector1,id:2586,x:29143,y:32545,varname:node_2586,prsc:2,v1:0.8;n:type:ShaderForge.SFN_Color,id:710,x:29753,y:32203,ptovrint:False,ptlb:ShadowColor,ptin:_ShadowColor,varname:_ShadowColor,prsc:0,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0,c2:0,c3:0,c4:1;n:type:ShaderForge.SFN_Multiply,id:841,x:28740,y:32290,varname:node_841,prsc:2|A-9169-OUT,B-1152-OUT;n:type:ShaderForge.SFN_Power,id:9496,x:29178,y:32290,varname:node_9496,prsc:2|VAL-6776-OUT,EXP-7634-OUT;n:type:ShaderForge.SFN_Vector1,id:7634,x:28895,y:32545,varname:node_7634,prsc:2,v1:2;n:type:ShaderForge.SFN_Clamp01,id:6776,x:28969,y:32290,varname:node_6776,prsc:2|IN-841-OUT;n:type:ShaderForge.SFN_Power,id:3348,x:31708,y:32375,varname:node_3348,prsc:2|VAL-6446-OUT,EXP-5302-OUT;n:type:ShaderForge.SFN_Vector1,id:5302,x:31494,y:32597,varname:node_5302,prsc:2,v1:2;proporder:1924-7907-6358-5132-595-4203-2492-8710-342-2040-5402-152-6632-3024-8293-5410-1420-5658-8806-710;pass:END;sub:END;*/

Shader "HeroShader/Characters/CharactersTemp" {
    Properties {
        _Color ("Color", Color) = (1,1,1,1)
        _MainTex ("MainTex", 2D) = "white" {}
        _AlphaRange ("AlphaRange", Range(0.6, 1)) = 0.8374977
        _Amout ("Amout", Range(0, 1)) = 0
        _BackColor ("BackColor", Color) = (0.4980392,0.4705883,0.427451,1)
        _FrontColor ("FrontColor", Color) = (0.8718101,0.8916488,0.9191176,1)
        _AmbientLight ("AmbientLight", Color) = (0.5,0.5,0.5,0.5)
        _EmissPower ("EmissPower", Range(0, 1)) = 0
        _EmissColor ("EmissColor", Color) = (0.5,0.5,0.5,1)
        _OutlineColor ("OutlineColor", Color) = (0.06082395,0.0898237,0.1102941,1)
        _OutlineSize ("OutlineSize", Range(0, 2)) = 0.1067961
        _DissolvSrc ("DissolvSrc", 2D) = "white" {}
        _RimRange ("RimRange", Range(0, 2)) = 0.2606722
        _RimColor ("RimColor", Color) = (0.5,0.5,0.5,1)
        _Matcap ("Matcap", 2D) = "white" {}
        _TopLight ("TopLight", Range(0, 3)) = 2.017328
        _TopLightPower ("TopLightPower", Range(0, 8)) = 5
        [MaterialToggle] _Outline ("Outline", Float ) = 0
        _Shadowlevel ("Shadowlevel", Range(-2, 1.07)) = 0
        _ShadowColor ("ShadowColor", Color) = (0,0,0,1)
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "Queue"="AlphaTest"
            "RenderType"="TransparentCutout"
        }
        LOD 800
        Pass {
            Name "Outline"
            Tags {
            }
            Cull Front
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma multi_compile_fog
            #pragma exclude_renderers d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform float _AlphaRange;
            uniform float4 _OutlineColor;
            uniform float _OutlineSize;
            uniform float _Amout;
            uniform sampler2D _DissolvSrc; uniform float4 _DissolvSrc_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                UNITY_FOG_COORDS(2)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos(float4(v.vertex.xyz + v.normal*min((saturate(((distance(mul(unity_ObjectToWorld, v.vertex).rgb,_WorldSpaceCameraPos)-_ProjectionParams.g)/150.0))*_OutlineSize),1.0),1) );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                float4 node_5789 = tex2D(_DissolvSrc,TRANSFORM_TEX(i.uv0, _DissolvSrc));
                float node_2937_if_leA = step(_Amout,pow(node_5789.r,1.0));
                float node_2937_if_leB = step(pow(node_5789.r,1.0),_Amout);
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                float node_3445 = 1.0;
                float node_6679 = 0.0;
                clip(lerp((node_2937_if_leA*((_MainTex_var.a-((_AlphaRange*node_3445)-node_3445))*node_3445))+(node_2937_if_leB*node_6679),node_6679,node_2937_if_leA*node_2937_if_leB) - 0.5);
                return fixed4(_OutlineColor.rgb,0);
            }
            ENDCG
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
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma exclude_renderers d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform float _AlphaRange;
            uniform float4 _FrontColor;
            uniform float4 _BackColor;
            uniform float4 _Color;
            uniform float _EmissPower;
            uniform float4 _EmissColor;
            uniform float _Amout;
            uniform sampler2D _DissolvSrc; uniform float4 _DissolvSrc_ST;
            uniform float _RimRange;
            uniform float4 _RimColor;
            uniform sampler2D _Matcap; uniform float4 _Matcap_ST;
            uniform float _TopLight;
            uniform float _TopLightPower;
            uniform float4 _AmbientLight;
            uniform fixed _Shadowlevel;
            uniform fixed4 _ShadowColor;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                UNITY_FOG_COORDS(3)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos(v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float4 node_5789 = tex2D(_DissolvSrc,TRANSFORM_TEX(i.uv0, _DissolvSrc));
                float node_2937_if_leA = step(_Amout,pow(node_5789.r,1.0));
                float node_2937_if_leB = step(pow(node_5789.r,1.0),_Amout);
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                float node_3445 = 1.0;
                float node_6679 = 0.0;
                clip(lerp((node_2937_if_leA*((_MainTex_var.a-((_AlphaRange*node_3445)-node_3445))*node_3445))+(node_2937_if_leB*node_6679),node_6679,node_2937_if_leA*node_2937_if_leB) - 0.5);
////// Lighting:
////// Emissive:
                float3 emissive = (_Color.rgb*(_EmissColor.rgb*_EmissPower));
                float3 node_4877 = (((pow(1.0-max(0,dot(normalDirection, viewDirection)),1.5)*_RimRange)*_RimColor.rgb)+(_MainTex_var.rgb*_Color.rgb));
                float3 node_3051 = lerp(_FrontColor.rgb,_BackColor.rgb,pow(max(0,dot(normalDirection,_AmbientLight.rgb)),2.0));
                float node_5761 = 1.0;
                float node_5170 = 5.0;
                float2 node_1320 = (mul( UNITY_MATRIX_V, float4(normalDirection,0) ).xyz.rgb.rg*0.5+0.5);
                float4 _Matcap_var = tex2D(_Matcap,TRANSFORM_TEX(node_1320, _Matcap));
                float3 node_784 = (float3(0.07,0.07,0.07)*(float3(0.05882353,0.05882353,0.05882353)*((pow(((_TopLight*1.0+-1.0)+1.0),node_5170)*_TopLightPower)+(pow(pow(1.0-max(0,dot(normalDirection, viewDirection)),2.0),node_5170)*2.0)))*_Matcap_var.r);
                float3 node_8835 = (_MainTex_var.rgb*node_784);
                float3 finalColor = emissive + ((node_4877*(node_3051+_AmbientLight.a)*lerp(_ShadowColor.rgb,float3(node_5761,node_5761,node_5761),(pow(saturate(((i.posWorld.g+(_Shadowlevel*2.0+-1.0))*0.5)),2.0)*0.8)))+node_8835);
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
        Pass {
            Name "ShadowCaster"
            Tags {
                "LightMode"="ShadowCaster"
            }
            Offset 1, 1
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_SHADOWCASTER
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma multi_compile_fog
            #pragma exclude_renderers d3d11_9x xbox360 xboxone ps3 ps4 psp2 
            #pragma target 3.0
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform float _AlphaRange;
            uniform float _Amout;
            uniform sampler2D _DissolvSrc; uniform float4 _DissolvSrc_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float2 uv0 : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.pos = UnityObjectToClipPos(v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                float4 node_5789 = tex2D(_DissolvSrc,TRANSFORM_TEX(i.uv0, _DissolvSrc));
                float node_2937_if_leA = step(_Amout,pow(node_5789.r,1.0));
                float node_2937_if_leB = step(pow(node_5789.r,1.0),_Amout);
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                float node_3445 = 1.0;
                float node_6679 = 0.0;
                clip(lerp((node_2937_if_leA*((_MainTex_var.a-((_AlphaRange*node_3445)-node_3445))*node_3445))+(node_2937_if_leB*node_6679),node_6679,node_2937_if_leA*node_2937_if_leB) - 0.5);
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Unlit/Texture"
    CustomEditor "ShaderForgeMaterialInspector"
}
