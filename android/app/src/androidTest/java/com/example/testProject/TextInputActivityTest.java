package com.example.testProject;

import android.app.Instrumentation;
import android.app.IntentService;
import android.os.SystemClock;
import android.provider.Settings;
import android.support.test.InstrumentationRegistry;
import android.support.test.espresso.Espresso;
import android.support.test.filters.LargeTest;
import android.support.test.rule.ActivityTestRule;
import android.support.test.runner.AndroidJUnit4;

import com.facebook.react.uimanager.util.ReactFindViewUtil;
import com.facebook.react.views.image.ReactImageView;
import com.testproject.MainActivity;

import org.junit.After;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;

import static android.support.test.espresso.Espresso.onView;
import static android.support.test.espresso.action.ViewActions.click;
import static android.support.test.espresso.action.ViewActions.pressBack;
import static android.support.test.espresso.action.ViewActions.typeText;
import static android.support.test.espresso.assertion.ViewAssertions.matches;
import static android.support.test.espresso.matcher.ViewMatchers.isDisplayed;
import static android.support.test.espresso.matcher.ViewMatchers.withClassName;
import static android.support.test.espresso.matcher.ViewMatchers.withContentDescription;
import static android.support.test.espresso.matcher.ViewMatchers.withHint;
import static android.support.test.espresso.matcher.ViewMatchers.withId;
import static android.support.test.espresso.matcher.ViewMatchers.withResourceName;
import static android.support.test.espresso.matcher.ViewMatchers.withText;
import static org.hamcrest.Matchers.allOf;
import static org.hamcrest.Matchers.endsWith;
import static org.hamcrest.Matchers.is;

/**
 * Created by pivotal on 2017-07-10.
 */

@RunWith(AndroidJUnit4.class)
@LargeTest


public class TextInputActivityTest {
//    static private MainActivityIdlingResource idlingResource;

    @Before
    public void  waitForAppToLoadUI() {
//        Instrumentation instrumentation = InstrumentationRegistry.getInstrumentation();
//        idlingResource = new MainActivityIdlingResource(instrumentation.getTargetContext());
//        Espresso.registerIdlingResources(idlingResource);
//
//        try {
//            Thread.sleep(500);
//        } catch (InterruptedException e) {
//            e.printStackTrace();
//        }
        SystemClock.sleep(500);
//
    }
//
//    @After
//    public void unregisterIntentServiceIdlingResource() {
//        Espresso.unregisterIdlingResources(idlingResource);
//    }

    @Rule
    public ActivityTestRule<MainActivity> mActivityTestRule = new ActivityTestRule<>(MainActivity.class);

    @Test
    public void allUIElementsAreVisibleUsingWithHint() {
        onView(withText("Text Input")).check(matches(isDisplayed()));
        onView(withHint("Type your text here!")).check(matches(isDisplayed()));
        onView(withHint("col 1")).check(matches(isDisplayed()));
        onView(withHint("col 2")).check(matches(isDisplayed()));
        onView(withText("NEXT")).check(matches(isDisplayed()));
    }

    @Test
    public void allUIElementsAreVisibleUsingWithContentDescription() {
        onView(withText(("Text Input"))).check(matches(isDisplayed()));
        onView(withContentDescription("an_input_1_id")).check(matches(isDisplayed()));
        onView(withContentDescription("an_input_2_id")).check(matches(isDisplayed()));
        onView(withContentDescription("an_input_3_id")).check(matches(isDisplayed()));
        onView(withContentDescription("an_Text_Input_Next")).check(matches(isDisplayed()));
    }

    @Test
    public void inputText1AndVerifyIsVisible() {
        String text1 = "This is a sample with some text";
        onView(withContentDescription("an_input_1_id")).perform(typeText(text1));
//        onView(allOf(withContentDescription("an_input_1_id"), withText(text1))).check(matches(isDisplayed()));
        onView(withContentDescription("an_input_1_id")).check(matches(withText(text1)));
    }

    @Test
    public void inputText2AndVerifyIsVisible() {
        String text2 = "hello";
        onView(withContentDescription("an_input_2_id")).perform(typeText(text2));
        onView(withContentDescription("an_input_2_id")).check(matches(withText(text2)));
    }

    @Test
    public void inputText3AndVerifyIsVisible() {
        String text3 = "blah blah blah";
        onView(withContentDescription("an_input_3_id")).perform(typeText(text3));
        onView(withContentDescription("an_input_3_id")).check(matches(withText(text3)));
    }

//    @Test
//    public void inputTextViaIDNumbersAndVerifyIsVisible() {
//        String text1 = "This is a sample with some text";
//        String text2 = "hello";
//        String text3 = "blah blah blah";
//        onView(withId(14)).perform(typeText(text1));
//        onView(withContentDescription("an_input_1_id")).check(matches(withText(text1)));
//        onView(withId(16)).perform(typeText(text2));
//        onView(withContentDescription("an_input_2_id")).check(matches(withText(text2)));
//        onView(withId(17)).perform(typeText(text3));
//        onView(withContentDescription("an_input_3_id")).check(matches(withText(text3)));
//
//    }

    @Test
    public void onPressNextAndBackButtonsScreenAndTextInputScreenLoad() {
        onView(withContentDescription("an_Text_Input_Next")).perform(click());

        onView(withText("Buttons")).check(matches(isDisplayed()));

        onView(allOf(withClassName(endsWith("ImageView")), withId(218))).perform(click());
//        SystemClock.sleep(2000);
        onView(withText("Text Input")).check(matches(isDisplayed()));
    }

}


















//    @Before
//    public void registerMainActivityIdlingResource() {
//        Instrumentation instrumentation = InstrumentationRegistry.getInstrumentation();
//        idlingResource = new MainActivityIdlingResource(instrumentation.getTargetContext());
//        Espresso.registerIdlingResources(idlingResource);
//
////        try {
////            Thread.sleep(5000);
////        } catch (InterruptedException e) {
////            e.printStackTrace();
////        }
//
//    }
//
//    @After
//    public void unregisterIntentServiceIdlingResource() {
//        Espresso.unregisterIdlingResources(idlingResource);
//    }