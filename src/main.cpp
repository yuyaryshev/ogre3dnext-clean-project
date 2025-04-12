#include <Ogre.h>
#include <OgreApplicationContext.h>
#include <OgreInput.h>
#include <OgreRTShaderSystem.h>

class MyApp : public OgreBites::ApplicationContext, public OgreBites::InputListener {
public:
    MyApp() : OgreBites::ApplicationContext("MyOgreApp") {}

    void setup() override {
        OgreBites::ApplicationContext::setup();
        addInputListener(this);

        Ogre::SceneManager* scnMgr = getRoot()->createSceneManager();
        Ogre::RTShader::ShaderGenerator::getSingleton().addSceneManager(scnMgr);

        Ogre::Camera* cam = scnMgr->createCamera("MainCam");
        cam->setNearClipDistance(5);
        cam->setAutoAspectRatio(true);

        Ogre::SceneNode* camNode = scnMgr->getRootSceneNode()->createChildSceneNode();
        camNode->attachObject(cam);
        camNode->setPosition(0, 0, 140);

        getRenderWindow()->addViewport(cam);

        Ogre::Light* light = scnMgr->createLight("MainLight");
        scnMgr->getRootSceneNode()->createChildSceneNode()->attachObject(light);
    }

    bool keyPressed(const OgreBites::KeyboardEvent& evt) override {
        if (evt.keysym.sym == OgreBites::SDLK_ESCAPE)
            getRoot()->queueEndRendering();
        return true;
    }
};

int main(int argc, char** argv) {
    MyApp app;
    app.initApp();
    app.getRoot()->startRendering();
    app.closeApp();
    return 0;
}
