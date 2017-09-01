package com.example.testProject;


import android.app.ActivityManager;
import android.content.Context;
import android.support.test.espresso.IdlingResource;

import com.testproject.MainActivity;

import static android.support.test.espresso.Espresso.onView;
import static android.support.test.espresso.assertion.ViewAssertions.matches;
import static android.support.test.espresso.matcher.ViewMatchers.isDisplayed;
import static android.support.test.espresso.matcher.ViewMatchers.withHint;
import static android.support.test.espresso.matcher.ViewMatchers.withText;


/**
 * Created by pivotal on 2017-07-12.
 */
public class MainActivityIdlingResource implements IdlingResource {
    private Context context;
    private ResourceCallback callback;


    public MainActivityIdlingResource(Context context) {
        this.context = context;

    }
    @Override
    public String getName() {
        return MainActivityIdlingResource.class.getName();
    }

    @Override
    public boolean isIdleNow() {
        boolean idle = isAppLoaded();
        if  (idle) {
            callback.onTransitionToIdle(); //called when the resource goes from busy to idle
        }
        return idle;
    }

    @Override
    public void registerIdleTransitionCallback(ResourceCallback resourceCallback) {
        this.callback = resourceCallback;
    }

    private boolean isAppLoaded() {

        return true;
    }
}
