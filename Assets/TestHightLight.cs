using UnityEngine;
using System.Collections;
using HighlightingSystem;

public class TestHightLight : MonoBehaviour {
	Highlighter h;
	// Use this for initialization
	void Start () {
		Highlighter h = GetComponent<Highlighter>();
		Color col = new Color(1,0,0, 1f);
		
		h.ConstantOnImmediate(col);


	}

	
	// Update is called once per frame
	void Update () {
	
	}
}
