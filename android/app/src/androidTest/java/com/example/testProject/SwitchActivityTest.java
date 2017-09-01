package com.example.testProject;

import android.os.SystemClock;
import android.support.test.rule.ActivityTestRule;

import com.testproject.MainActivity;

import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;

import static android.support.test.espresso.Espresso.onView;
import static android.support.test.espresso.action.ViewActions.click;
import static android.support.test.espresso.action.ViewActions.scrollTo;
import static android.support.test.espresso.assertion.ViewAssertions.matches;
import static android.support.test.espresso.matcher.ViewMatchers.isChecked;
import static android.support.test.espresso.matcher.ViewMatchers.isDescendantOfA;
import static android.support.test.espresso.matcher.ViewMatchers.isDisplayed;
import static android.support.test.espresso.matcher.ViewMatchers.isNotChecked;
import static android.support.test.espresso.matcher.ViewMatchers.withChild;
import static android.support.test.espresso.matcher.ViewMatchers.withClassName;
import static android.support.test.espresso.matcher.ViewMatchers.withContentDescription;
import static android.support.test.espresso.matcher.ViewMatchers.withText;
import static org.hamcrest.Matchers.allOf;
import static org.hamcrest.Matchers.endsWith;
import static org.hamcrest.Matchers.not;

/**
 * Created by pivotal on 2017-07-20.
 */
public class SwitchActivityTest {
    @Rule
    public ActivityTestRule<MainActivity> mActivityTestRule = new ActivityTestRule<>(MainActivity.class);

    @Before
    public void navigateToSwitchScreen() {
        SystemClock.sleep(500);
        onView(withContentDescription("an_Text_Input_Next"))
                .check(matches(isDisplayed()))
                .perform(click());
        onView(withContentDescription("an_Buttons_Next"))
                .check(matches(isDisplayed()))
                .perform(click());
        onView(withContentDescription("an_Flat_List_Next"))
                .perform(scrollTo())
                .check(matches(isDisplayed()))
                .perform(click());
        onView(withContentDescription("an_Section_List_Next"))
                .perform(scrollTo())
                .check(matches(isDisplayed()))
                .perform(click());
        onView(withContentDescription("an_Picker_Next")).perform(click());
    }

    @Test
    public void allUIElementsAreVisible() {
        onView(withText("Switch")).check(matches(isDisplayed()));
        onView(allOf(withClassName(endsWith("ImageView")), isDescendantOfA(withContentDescription("Picker"))))
                .check(matches(isDisplayed()));
        onView(withContentDescription("an_defaultOFF_id")).check(matches(isDisplayed()));
        onView(withContentDescription("an_defaultON_id")).check(matches(isDisplayed()));
        onView(withContentDescription("an_left_switch_id")).check(matches(withText("OFF")));
        onView(withContentDescription("an_right_switch_id")).check(matches(withText("ON")));
        onView(withContentDescription("an_Switch_Next")).check(matches(withChild(withText("NEXT"))));
    }

    @Test
    public void turnLeftSwitchONAndOFFAndVerifyUpdated() {
        onView(withContentDescription("an_left_switch_id")).check(matches(withText("OFF")));
        onView(allOf(withClassName(endsWith("Switch")), withContentDescription("an_defaultOFF_id")))
                .check(matches(isNotChecked()))
                .perform(click())
                .check(matches(isChecked()));
        onView(withContentDescription("an_left_switch_id")).check(matches(withText("ON")));
    }

    @Test
    public void turnRightSwitchOFAndONAndVerifyUpdated() {
        onView(withContentDescription("an_right_switch_id")).check(matches(withText("ON")));
        onView(allOf(withClassName(endsWith("Switch")), withContentDescription("an_defaultON_id")))
                .check(matches(isChecked()))
                .perform(click())
                .check(matches(isNotChecked()));
        onView(withContentDescription("an_right_switch_id")).check(matches(withText("OFF")));
    }

    @Test
    public void onPressNextAndBackSliderScreenAndSwitchScreenLoad() {
        onView(withContentDescription("an_Switch_Next"))
                .perform(click());
        onView(withText("Slider")).check(matches(isDisplayed()));
        onView(allOf(withClassName(endsWith("ImageView")), isDescendantOfA(withContentDescription("Switch")))).perform(click());
        onView(withText("Switch")).check(matches(isDisplayed()));
    }


}
