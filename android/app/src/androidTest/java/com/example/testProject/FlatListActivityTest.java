package com.example.testProject;

import android.os.SystemClock;
import android.support.test.rule.ActivityTestRule;

import com.testproject.MainActivity;
import com.testproject.R;

import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;

import static android.support.test.espresso.Espresso.onView;
import static android.support.test.espresso.action.ViewActions.click;
import static android.support.test.espresso.action.ViewActions.scrollTo;
import static android.support.test.espresso.action.ViewActions.swipeUp;
import static android.support.test.espresso.assertion.ViewAssertions.matches;
import static android.support.test.espresso.matcher.ViewMatchers.hasDescendant;
import static android.support.test.espresso.matcher.ViewMatchers.isDescendantOfA;
import static android.support.test.espresso.matcher.ViewMatchers.isDisplayed;
import static android.support.test.espresso.matcher.ViewMatchers.withClassName;
import static android.support.test.espresso.matcher.ViewMatchers.withContentDescription;
import static android.support.test.espresso.matcher.ViewMatchers.withId;
import static android.support.test.espresso.matcher.ViewMatchers.withText;
import static org.hamcrest.Matchers.allOf;
import static org.hamcrest.Matchers.endsWith;

/**
 * Created by pivotal on 2017-07-20.
 */
public class FlatListActivityTest {
    @Rule
    public ActivityTestRule<MainActivity> mActivityTestRule = new ActivityTestRule<>(MainActivity.class);

    @Before
    public void navigateToFlatListScreen() {
        SystemClock.sleep(500);
        onView(withContentDescription("an_Text_Input_Next"))
                .check(matches(isDisplayed()))
                .perform(click());
        onView(withContentDescription("an_Buttons_Next"))
                .check(matches(isDisplayed()))
                .perform(click());
    }

    @Test
    public void headerBackButtonNextButtonAreVisible() {
        onView(withText("Flat List")).check(matches(isDisplayed()));
        //back button
        onView(allOf(withClassName(endsWith("ImageView")), isDescendantOfA(withContentDescription("Buttons")))).check(matches(isDisplayed()));
        //next button
        onView(withContentDescription("an_Flat_List_Next"))
                .perform(scrollTo())
                .check(matches(hasDescendant(withText("NEXT"))));
    }

    @Test
    public void itemsElementsAreVisible() {
        onView(withContentDescription("flat Item 1"))
                .perform(scrollTo())
                .check(matches(isDisplayed()));
        onView(withContentDescription("flat Item 2"))
                .perform(scrollTo())
                .check(matches(isDisplayed()));
        onView(withContentDescription("flat Item 3"))
                .perform(scrollTo())
                .check(matches(isDisplayed()));
        onView(withContentDescription("flat Item 4"))
                .perform(scrollTo())
                .check(matches(isDisplayed()));
        onView(withContentDescription("flat Item 5"))
                .perform(scrollTo())
                .check(matches(isDisplayed()));
        onView(withContentDescription("flat Item 6"))
                .perform(scrollTo())
                .check(matches(isDisplayed()));
        onView(withContentDescription("flat Item 7"))
                .perform(scrollTo())
                .check(matches(isDisplayed()));
        onView(withContentDescription("flat Item 8"))
                .perform(scrollTo())
                .check(matches(isDisplayed()));
        onView(withContentDescription("flat Item 9"))
                .perform(scrollTo())
                .check(matches(isDisplayed()));
        onView(withContentDescription("flat Item 10"))
                .perform(scrollTo())
                .check(matches(isDisplayed()));
        onView(withContentDescription("flat Item 11"))
                .perform(scrollTo())
                .check(matches(isDisplayed()));
        onView(withContentDescription("flat Item 12"))
                .perform(scrollTo())
                .check(matches(isDisplayed()));

    }

    @Test
    public void onPressNextAndBackSectionListAndFlatListScreenLoad() {
        onView(withContentDescription("an_Flat_List_Next"))
                .perform(scrollTo())
                .perform(click());
        onView(withText("Section List")).check(matches(isDisplayed()));
        onView(allOf(withClassName(endsWith("ImageView")), isDescendantOfA(withContentDescription("Flat List")))).perform(click());
        onView(withText("Flat List")).check(matches(isDisplayed()));
    }
}
