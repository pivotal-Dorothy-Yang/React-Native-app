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
import static android.support.test.espresso.matcher.ViewMatchers.hasDescendant;
import static android.support.test.espresso.matcher.ViewMatchers.isDescendantOfA;
import static android.support.test.espresso.matcher.ViewMatchers.isDisplayed;
import static android.support.test.espresso.matcher.ViewMatchers.withChild;
import static android.support.test.espresso.matcher.ViewMatchers.withClassName;
import static android.support.test.espresso.matcher.ViewMatchers.withContentDescription;
import static android.support.test.espresso.matcher.ViewMatchers.withText;
import static org.hamcrest.Matchers.allOf;
import static org.hamcrest.Matchers.endsWith;
import static org.hamcrest.Matchers.is;

/**
 * Created by pivotal on 2017-07-20.
 */

public class SectionListActivityTest {
    @Rule
    public ActivityTestRule<MainActivity> mActivityTestRule = new ActivityTestRule<>(MainActivity.class);

    @Before
    public void navigateToSectionListScreen() {
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
    }

    @Test
    public void checkHeaderBackButtonAndNextButtonAreVisible() {
        onView(withText("Section List")).check(matches(isDisplayed()));
        onView(allOf(withClassName(endsWith("ImageView")), isDescendantOfA(withContentDescription("Flat List")))).check(matches(isDisplayed()));
        onView(allOf(withContentDescription("an_Section_List_Next"), withChild(withText("NEXT"))))
                .perform(scrollTo())
                .check(matches(isDisplayed()));
    }

    @Test
    public void verifyDataElementsAreVisible() {
        onView(withText("D"))
                .perform(scrollTo())
                .check(matches(isDisplayed()));
        onView(withText("Data 1"))
                .perform(scrollTo())
                .check(matches(isDisplayed()));
        onView(withText("Data 2"))
                .perform(scrollTo())
                .check(matches(isDisplayed()));
        onView(withText("Data 3"))
                .perform(scrollTo())
                .check(matches(isDisplayed()));
        onView(withText("Data 4"))
                .perform(scrollTo())
                .check(matches(isDisplayed()));
    }

    @Test
    public void verifyItemElementsAreVisible() {
        onView(withText("I"))
                .perform(scrollTo())
                .check(matches(isDisplayed()));
        onView(withContentDescription("section Item 1"))
                .perform(scrollTo())
                .check(matches(isDisplayed()));
        onView(withContentDescription("section Item 2"))
                .perform(scrollTo())
                .check(matches(isDisplayed()));
        onView(withContentDescription("section Item 3"))
                .perform(scrollTo())
                .check(matches(isDisplayed()));
        onView(withContentDescription("section Item 4"))
                .perform(scrollTo())
                .check(matches(isDisplayed()));
        onView(withContentDescription("section Item 5"))
                .perform(scrollTo())
                .check(matches(isDisplayed()));
    }

    @Test
    public void verifyTaskElementsAreVisible() {
        onView(withText("T"))
                .perform(scrollTo())
                .check(matches(isDisplayed()));
        onView(withText("Task 1"))
                .perform(scrollTo())
                .check(matches(isDisplayed()));
        onView(withText("Task 2"))
                .perform(scrollTo())
                .check(matches(isDisplayed()));
        onView(withText("Task 3"))
                .perform(scrollTo())
                .check(matches(isDisplayed()));
    }

    @Test
    public void onPressNextAndBackPickerScreenAndSectionListScreenLoad() {
        onView(withContentDescription("an_Section_List_Next"))
                .perform(scrollTo())
                .perform(click());
        onView(withText("Picker")).check(matches(isDisplayed()));
        onView(allOf(withClassName(endsWith("ImageView")), isDescendantOfA(withContentDescription("Section List")))).perform(click());
        onView(withText("Section List")).check(matches(isDisplayed()));

    }
}
