using System.Collections;
using System.Collections.Generic;
using UnityEngine.SceneManagement;
using UnityEngine;

public class SceneManagment : MonoBehaviour
{
    public void GotoLandingScene()
    {
        SceneManager.LoadScene("landingscreen");
    }

    public void GotoAboutScene()
    {
        SceneManager.LoadScene("aboutus");
    }

    public void GotoCategoryScene()
    {
        SceneManager.LoadScene("category");
    }
}
