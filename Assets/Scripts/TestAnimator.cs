using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TestAnimator : MonoBehaviour {

	Animator mAnim;
	// Use this for initialization
	void Start () {
		mAnim = GetComponent<Animator> ();
	}
	
	// Update is called once per frame
	void Update () {
		if (Input.GetKeyDown (KeyCode.H)) {
			mAnim.Play ("Atk1");
		}
		if (Input.GetKeyDown (KeyCode.J)) {
			mAnim.Play ("Atk2");
		}
		if (Input.GetKeyDown (KeyCode.K)) {
			mAnim.Play ("Atk3");
		}
		if (Input.GetKeyDown (KeyCode.L)) {
			mAnim.Play ("Atk4");
		}
	}

	public void PlayEffect(string effectName){
		Transform trans = transform.Find (effectName);
		if (trans != null) {
			trans.gameObject.SetActive (false);
			trans.gameObject.SetActive (true);
		}
	}

	public void AttackSpot(){
		Debug.Log ("AttackSpot");
	}

	public void HitPoint(){
		Debug.Log ("HitPoint");
	}
}
