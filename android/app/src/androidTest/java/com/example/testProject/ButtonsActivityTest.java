package com.example.testProject;

import android.os.SystemClock;
import android.support.test.rule.ActivityTestRule;

import com.testproject.MainActivity;

import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Rule;
import org.junit.Test;

import static android.support.test.espresso.Espresso.onView;
import static android.support.test.espresso.action.ViewActions.click;
import static android.support.test.espresso.assertion.ViewAssertions.matches;
import static android.support.test.espresso.matcher.ViewMatchers.isClickable;
import static android.support.test.espresso.matcher.ViewMatchers.isDescendantOfA;
import static android.support.test.espresso.matcher.ViewMatchers.isDisplayed;
import static android.support.test.espresso.matcher.ViewMatchers.withClassName;
import static android.support.test.espresso.matcher.ViewMatchers.withContentDescription;
import static android.support.test.espresso.matcher.ViewMatchers.withId;
import static android.support.test.espresso.matcher.ViewMatchers.withResourceName;
import static android.support.test.espresso.matcher.ViewMatchers.withTagKey;
import static android.support.test.espresso.matcher.ViewMatchers.withText;
import static org.hamcrest.Matchers.allOf;
import static org.hamcrest.Matchers.endsWith;
import static org.hamcrest.Matchers.is;
//import static android.support.v7.appcompat.R;


/**
 * Created by pivotal on 2017-07-20.
 */
public class ButtonsActivityTest {
    @Before
    public void navigateToButtonsScreen() {
        SystemClock.sleep(500);
        onView(withContentDescription("an_Text_Input_Next")).check(matches(isDisplayed())).perform(click());
    }

    @Rule
    public ActivityTestRule<MainActivity> mActivityTestRule = new ActivityTestRule<>(MainActivity.class);

    @Test
    public void allElementsAreVisibleUsingText() {
        onView(withText("Buttons")).check(matches(isDisplayed()));
        onView(withText("BUTTON 1")).check(matches(isDisplayed()));
        onView(withText("BUTTON 2")).check(matches(isDisplayed()));
        onView(withText("BUTTON 3")).check(matches(isDisplayed()));
        onView(withText("BUTTON 4")).check(matches(isDisplayed()));
        onView(withText("BUTTON 5")).check(matches(isDisplayed()));
        onView(withText("BUTTON 6")).check(matches(isDisplayed()));
        //butterfly pic
        onView(allOf(withContentDescription("butterfly"), withClassName(endsWith("ImageView")))).check(matches(isDisplayed()));
        //back button
        onView(allOf(withClassName(endsWith("ImageView")), isDescendantOfA(withContentDescription("Text Input"))))
                .check(matches(isDisplayed()));
        //next button
        onView(withContentDescription("an_Buttons_Next")).check(matches(isDisplayed()));

        //back button, worse way of asserting than sing isDescendantOfA
//        use id: 74 if just running the test by itself
//        onView(allOf(withClassName(endsWith("ImageView")), withId(220))).check(matches(isDisplayed()));

    }

    @Test
    public void allElementsAreVisibleUsingContentDescription() {
        onView(withText("Buttons")).check(matches(isDisplayed()));
        onView(withContentDescription("an_button_1_id")).check(matches(isDisplayed()));
        onView(withContentDescription("an_button_2_id")).check(matches(isDisplayed()));
        onView(withContentDescription("an_button_3_id")).check(matches(isDisplayed()));
        onView(withContentDescription("an_button_4_id")).check(matches(isDisplayed()));
        onView(withContentDescription("an_button_5_id")).check(matches(isDisplayed()));
        onView(withContentDescription("an_button_6_id")).check(matches(isDisplayed()));
        //butterfly pic
        onView(allOf(withContentDescription("butterfly"), withClassName(endsWith("ImageView")))).check(matches(isDisplayed()));
        //back button
        onView(allOf(withClassName(endsWith("ImageView")), isDescendantOfA(withContentDescription("Text Input"))))
                .check(matches(isDisplayed()));
        //next button
        onView(withContentDescription("an_Buttons_Next")).check(matches(isDisplayed()));

//        use id: 74 if just running the test by itself
//        onView(allOf(withClassName(endsWith("ImageView")), withId(367))).check(matches(isDisplayed()));
//        onView(allOf(withClassName(endsWith("ImageView")), withId(367))).check(matches(isDisplayed()));
    }

    @Test
    public void clickButton1VerifyAlertAndClickOK() {
        onView(withText("BUTTON 1"))
                .check(matches(isDisplayed()))
                .perform(click());
        onView(withResourceName("alertTitle")).check(matches(withText("You pressed button 1!")));
        onView(withResourceName("button1"))
                .check(matches(withText("OK")))
                .check(matches(isClickable()));
        onView(withResourceName("button1")).perform(click());
        onView(withText("Buttons")).check(matches(isDisplayed()));
    }

    @Test
    public void clickButton2VerifyAlertAndClickOK() {
        onView(withText("BUTTON 2"))
                .check(matches(isDisplayed()))
                .perform(click());
        onView(withResourceName("alertTitle")).check(matches(withText("You pressed button 2!")));
        onView(withResourceName("button1"))
                .check(matches(withText("OK")))
                .check(matches(isClickable()));
        onView(withResourceName("button1")).perform(click());
        onView(withText("Buttons")).check(matches(isDisplayed()));
    }

    @Test
    public void clickButton3VerifyAlertAndClickOK() {
        onView(withText("BUTTON 3"))
                .check(matches(isDisplayed()))
                .perform(click());
        onView(withResourceName("alertTitle")).check(matches(withText("You pressed button 3!")));
        onView(withResourceName("button1"))
                .check(matches(withText("OK")))
                .check(matches(isClickable()));
        onView(withResourceName("button1")).perform(click());
        onView(withText("Buttons")).check(matches(isDisplayed()));
    }

    @Test
    public void clickButton4VerifyAlertAndClickOK() {
        onView(withText("BUTTON 4"))
                .check(matches(isDisplayed()))
                .perform(click());
        onView(withResourceName("alertTitle")).check(matches(withText("You pressed button 4!")));
        onView(withResourceName("button1"))
                .check(matches(withText("OK")))
                .check(matches(isClickable()));
        onView(withResourceName("button1")).perform(click());
        onView(withText("Buttons")).check(matches(isDisplayed()));
    }

    @Test
    public void clickButton5VerifyAlertAndClickOK() {
        onView(withText("BUTTON 5"))
                .check(matches(isDisplayed()))
                .perform(click());
        onView(withResourceName("alertTitle")).check(matches(withText("You pressed button 5!")));
        onView(withResourceName("button1"))
                .check(matches(withText("OK")))
                .check(matches(isClickable()));
        onView(withResourceName("button1")).perform(click());
        onView(withText("Buttons")).check(matches(isDisplayed()));
    }

    @Test
    public void clickButton6VerifyAlertAndClickOK() {
        onView(withText("BUTTON 6"))
                .check(matches(isDisplayed()))
                .perform(click());
        onView(withResourceName("alertTitle")).check(matches(withText("You pressed button 6!")));
        onView(withResourceName("button1"))
                .check(matches(withText("OK")))
                .check(matches(isClickable()));
        onView(withResourceName("button1")).perform(click());
        onView(withText("Buttons")).check(matches(isDisplayed()));
    }

    @Test
    public void OnPressNextAndBackFlatListScreenAndButtonsScreenLoad() {
        onView(withContentDescription("an_Buttons_Next")).perform(click());
        onView(withText("Flat List")).check(matches(isDisplayed()));
        onView(allOf(withClassName(endsWith("ImageView")), isDescendantOfA(withContentDescription("Buttons")))).perform(click());
        onView(withText("Buttons")).check(matches(isDisplayed()));
    }
}
