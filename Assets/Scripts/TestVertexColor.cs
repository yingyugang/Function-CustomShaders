using UnityEngine;
using System.Collections;

public class TestVertexColor : MonoBehaviour {
	public Color color;
	public Shader shader;
	// Use this for initialization
	void Start () {
	
	}
	
	// Update is called once per frame
	void Update () {
		if(Input.GetKeyDown(KeyCode.K))
		{
			Mesh mesh = GetComponent<MeshFilter>().mesh;
			Color[] colors = new Color[mesh.vertices.Length];
			for(int i = 0;i< colors.Length;i++)
			{
				colors[i] = color;
			}
			mesh.colors = colors;
//			mesh.RecalculateNormals();
			Debug.Log(colors.Length);
			GetComponent<MeshFilter>().mesh = mesh;
			GetComponent<MeshRenderer>().material.shader = shader;
		}
	}
}
