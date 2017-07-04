using UnityEngine;
using System.Collections;

public class ShanXian : MonoBehaviour {
	Animation anim;
	public SkinnedMeshRenderer smr;
	public SkinnedMeshRenderer smr1;
	public float delay = 0.1f;
	public float forward = 3;
	Vector3 startPos;
	Material mat;
	Material mat1;
	// Use this for initialization
	void Start () {
		anim = GetComponent<Animation> ();
		mat = smr.material;
		mat1 = smr1.material;
		startPos = transform.position;
	}
	
	// Update is called once per frame
	void Update () {

	}

	void OnGUI()
	{
		if(GUI.Button(new Rect(10,10,100,30),"消失"))
		{
			StopCoroutine("_Shan");
			StartCoroutine("_Shan");
		}
		if(GUI.Button(new Rect(10,40,100,30),"Reset"))
		{
			StopCoroutine("_Shan");
			transform.position = startPos;
		}
	}
	public float tt = 1;
	IEnumerator _Shan()
	{
		anim.Play ("Ult");
		float t = 0;
		yield return new WaitForSeconds (delay);
		while(t < 1 )
		{
			t += Time.deltaTime / tt;
			mat.SetFloat("_DisintegrateAmount",t);
			mat1.SetFloat("_DisintegrateAmount",t);
			yield return null;
		}
		transform.position += transform.forward * forward;
		yield return new WaitForSeconds (delay);
		t = 0;
		while(t < 1 )
		{
			t += Time.deltaTime / tt;
			mat.SetFloat("_DisintegrateAmount",1-t);
			mat1.SetFloat("_DisintegrateAmount",1-t);
			yield return null;
		}

	}

}
