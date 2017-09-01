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
import static android.support.test.espresso.matcher.ViewMatchers.isDescendantOfA;
import static android.support.test.espresso.matcher.ViewMatchers.isDisplayed;
import static android.support.test.espresso.matcher.ViewMatchers.withClassName;
import static android.support.test.espresso.matcher.ViewMatchers.withContentDescription;
import static android.support.test.espresso.matcher.ViewMatchers.withText;
import static org.hamcrest.Matchers.allOf;
import static org.hamcrest.Matchers.endsWith;

/**
 * Created by pivotal on 2017-07-21.
 */
public class ScrollingActivityTest {
    @Rule
    public ActivityTestRule<MainActivity> mActivityTestRule = new ActivityTestRule<>(MainActivity.class);

    @Before
    public void navigateToSliderScreen() {
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
        onView(withContentDescription("an_Switch_Next")).perform(click());
        onView(withContentDescription("an_Slider_Next")).perform(click());
    }

    @Test
    public void HeaderBackButtonNextButtonAreVisible() {
        onView(withText("Scrolling")).check(matches(isDisplayed()));
        onView(allOf(withClassName(endsWith("ImageView")), isDescendantOfA(withContentDescription("Slider"))))
                .check(matches(isDisplayed()));
    }

    @Test
    public void verifyRowsAreDisplayed() {
        onView(withContentDescription("an_row_1_id"))
                .perform(scrollTo())
                .check(matches(isDisplayed()));
        onView(withContentDescription("an_row_2_id"))
                .perform(scrollTo())
                .check(matches(isDisplayed()));
        onView(withContentDescription("an_row_3_id"))
                .perform(scrollTo())
                .check(matches(isDisplayed()));
        onView(withContentDescription("an_row_4_id"))
                .perform(scrollTo())
                .check(matches(isDisplayed()));
        onView(withContentDescription("an_row_5_id"))
                .perform(scrollTo())
                .check(matches(isDisplayed()));
        SystemClock.sleep(1000);
        onView(withContentDescription("an_row_6_id"))
                .perform(scrollTo())
                .check(matches(isDisplayed()));
        onView(withContentDescription("an_row_7_id"))
                .perform(scrollTo())
                .check(matches(isDisplayed()));
        onView(withContentDescription("an_row_8_id"))
                .perform(scrollTo())
                .check(matches(isDisplayed()));
        onView(withContentDescription("an_row_9_id"))
                .perform(scrollTo())
                .check(matches(isDisplayed()));
        onView(withContentDescription("an_row_10_id"))
                .perform(scrollTo())
                .check(matches(isDisplayed()));
        SystemClock.sleep(1000);
        onView(withContentDescription("an_row_11_id"))
                .perform(scrollTo())
                .check(matches(isDisplayed()));
        onView(withContentDescription("an_row_12_id"))
                .perform(scrollTo())
                .check(matches(isDisplayed()));
        onView(withContentDescription("an_row_13_id"))
                .perform(scrollTo())
                .check(matches(isDisplayed()));
        onView(withContentDescription("an_row_14_id"))
                .perform(scrollTo())
                .check(matches(isDisplayed()));
        onView(withContentDescription("an_row_15_id"))
                .perform(scrollTo())
                .check(matches(isDisplayed()));
        SystemClock.sleep(1000);
    }

    @Test
    public void verifyImagesAreVisible() {
        onView(withContentDescription("an_img_1"))
                .perform(scrollTo())
                .check(matches(isDisplayed()));
        onView(withContentDescription("an_img_2"))
                .perform(scrollTo())
                .check(matches(isDisplayed()));
        onView(withContentDescription("an_img_3"))
                .perform(scrollTo())
                .check(matches(isDisplayed()));
        onView(withContentDescription("an_img_4"))
                .perform(scrollTo())
                .check(matches(isDisplayed()));
        onView(withContentDescription("an_img_5"))
                .perform(scrollTo())
                .check(matches(isDisplayed()));
    }

}
