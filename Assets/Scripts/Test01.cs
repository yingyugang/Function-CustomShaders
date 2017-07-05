using UnityEngine;
using System.Collections;

public class Test01 : MonoBehaviour {

	public Material mat01;
	public Material mat02;

	float t =0;
	public float speed = 0.2f; 
	public bool loop = false;
	bool change = true;
	void Update()
	{

		t += Time.deltaTime * speed;
		if (!loop && t >= 1) {
			change = false;
		}
		if(change)
		{
			mat01.SetFloat ("_Amount",t - (int)t);
			mat02.SetFloat ("_Amount", t - (int)t);
		}

	}


}
