Shader "圣剑战姬 Shader/翻牌效果shader" {
	Properties {
		_MainTex ("头牌", 2D) = "white" {}
		_MainTex2 ("底牌", 2D) = "white" {}
		_percent("百分比", Range(-0.3, 1)) = 0

	}
	
	 
	
	CGINCLUDE
        #include "UnityCG.cginc"           
      
        sampler2D _MainTex;
        sampler2D _MainTex2;		
		float _percent;
		fixed4 _DefColor;
		
        struct v2f {    
            half4 pos:SV_POSITION;    
            half4 uv : TEXCOORD0;   
        };  
  
        v2f vert(appdata_full v) {  
            v2f o;  
            o.pos = mul (UNITY_MATRIX_MVP, v.vertex);  
            o.uv.xy = v.texcoord.xy;
            o.uv.zw = v.texcoord.xy + _Time.xx ;
            return o;  
        }  
  
        fixed4 frag(v2f i) : COLOR0 {

			fixed4 tex0 = tex2D(_MainTex2, i.uv.xy);
			fixed4 tex1 = tex2D(_MainTex, i.uv.xy );
			tex0.a = 1;
			
			
            return lerp(tex0, tex1, smoothstep(0, 0.1, i.uv.y-_percent));//注XY为翻牌方向
            //return lerp(tex0, tex1, smoothstep(1, 0.1, i.uv.x-_percent));//注XY为翻牌方向

        }  
    ENDCG    
  
    SubShader {   
        Tags {"Queue" = "Transparent"}     
        ZWrite Off     
        Blend SrcAlpha OneMinusSrcAlpha     
        Pass {    
            CGPROGRAM    
            #pragma vertex vert    
            #pragma fragment frag    
            #pragma fragmentoption ARB_precision_hint_fastest     
  
            ENDCG    
        }
    }
    FallBack Off  
}
