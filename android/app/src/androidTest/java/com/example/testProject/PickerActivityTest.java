package com.example.testProject;

import android.os.SystemClock;
import android.support.test.rule.ActivityTestRule;

import com.testproject.MainActivity;

import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;

import static android.support.test.espresso.Espresso.onData;
import static android.support.test.espresso.Espresso.onView;
import static android.support.test.espresso.action.ViewActions.click;
import static android.support.test.espresso.action.ViewActions.scrollTo;
import static android.support.test.espresso.assertion.ViewAssertions.matches;
import static android.support.test.espresso.matcher.ViewMatchers.isChecked;
import static android.support.test.espresso.matcher.ViewMatchers.isDescendantOfA;
import static android.support.test.espresso.matcher.ViewMatchers.isDisplayed;
import static android.support.test.espresso.matcher.ViewMatchers.withChild;
import static android.support.test.espresso.matcher.ViewMatchers.withClassName;
import static android.support.test.espresso.matcher.ViewMatchers.withContentDescription;
import static android.support.test.espresso.matcher.ViewMatchers.withResourceName;
import static android.support.test.espresso.matcher.ViewMatchers.withText;
import static org.hamcrest.Matchers.allOf;
import static org.hamcrest.Matchers.anything;
import static org.hamcrest.Matchers.endsWith;
import static org.hamcrest.Matchers.hasKey;
import static org.hamcrest.Matchers.hasToString;
import static org.hamcrest.Matchers.hasValue;
import static org.hamcrest.Matchers.is;
import static org.hamcrest.Matchers.startsWith;


/**
 * Created by pivotal on 2017-07-20.
 */
public class PickerActivityTest {
    @Rule
    public ActivityTestRule<MainActivity> mActivityTestRule = new ActivityTestRule<>(MainActivity.class);

    @Before
    public void navigateToPickerScreen() {
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
    }

    @Test
    public void presetElementsAreVisible() {
        onView(withText("Picker")).check(matches(isDisplayed()));
        onView(allOf(withClassName(endsWith("ImageView")), isDescendantOfA(withContentDescription("Section List")))).check(matches(isDisplayed()));
        onView(withText("Days of the Week")).check(matches(isDisplayed()));
        //picker
        onView(withResourceName("text1")).check(matches(withText("Monday")));
        onView(withText("You picked: Monday")).check(matches(isDisplayed()));
        onView(withContentDescription("an_Picker_Next")).check(matches(withChild(withText("NEXT"))));

    }

    @Test
    public void setPickerToMondayAndVerifyIsUpdated() {
        onView(withClassName(endsWith("Picker"))).perform(click());
        onData(anything()).inAdapterView(withResourceName("select_dialog_listview")).atPosition(0).perform(click());
        onView(withResourceName("text1")).check(matches(withText("Monday")));
        onView(withText("You picked: Monday")).check(matches(isDisplayed()));
    }

    @Test
    public void setPickerToTuesdayAndVerifyIsUpdated() {
        onView(withClassName(endsWith("Picker"))).perform(click());
//      onData solution to select Tuesday. Can be used because it is a ListView
        onData(anything()).inAdapterView(withResourceName("select_dialog_listview")).atPosition(1).perform(click());
//      could also use onView:
//      onView(withText("Tuesday")).perform(click());
        onView(withResourceName("text1")).check(matches(withText("Tuesday")));
        onView(withText("You picked: Tuesday")).check(matches(isDisplayed()));
    }

    @Test
    public void setPickerToWednesdayAndVerifyIsUpdated() {
        onView(withClassName(endsWith("Picker"))).perform(click());
        onData(anything()).inAdapterView(withResourceName("select_dialog_listview")).atPosition(2).perform(click());
        onView(withResourceName("text1")).check(matches(withText("Wednesday")));
        onView(withText("You picked: Wednesday")).check(matches(isDisplayed()));
    }

    @Test
    public void setPickerToThursdayAndVerifyIsUpdated() {
        onView(withClassName(endsWith("Picker"))).perform(click());
        onData(anything()).inAdapterView(withResourceName("select_dialog_listview")).atPosition(3).perform(click());
        onView(withResourceName("text1")).check(matches(withText("Thursday")));
        onView(withText("You picked: Thursday")).check(matches(isDisplayed()));
    }

    @Test
    public void setPickerToFridayAndVerifyIsUpdated() {
        onView(withClassName(endsWith("Picker"))).perform(click());
        onData(anything()).inAdapterView(withResourceName("select_dialog_listview")).atPosition(4).perform(click());
        onView(withResourceName("text1")).check(matches(withText("Friday")));
        onView(withText("You picked: Friday")).check(matches(isDisplayed()));
    }

    @Test
    public void setPickerToSaturdayAndVerifyIsUpdated() {
        onView(withClassName(endsWith("Picker"))).perform(click());
        onData(anything()).inAdapterView(withResourceName("select_dialog_listview")).atPosition(5).perform(click());
        onView(withResourceName("text1")).check(matches(withText("Saturday")));
        onView(withText("You picked: Saturday")).check(matches(isDisplayed()));
    }

    @Test
    public void setPickerToSundayAndVerifyIsUpdated() {
        onView(withClassName(endsWith("Picker"))).perform(click());
        onData(anything()).inAdapterView(withResourceName("select_dialog_listview")).atPosition(6).perform(click());
        onView(withResourceName("text1")).check(matches(withText("Sunday")));
        onView(withText("You picked: Sunday")).check(matches(isDisplayed()));
    }

    @Test
    public void onPressNextAndBackSwitchScreenAndPickerScreenLoad() {
        onView(withContentDescription("an_Picker_Next")).perform(click());
        onView(withText("Switch")).check(matches(isDisplayed()));
        onView(allOf(withClassName(endsWith("ImageView")), isDescendantOfA(withContentDescription("Picker")))).perform(click());
        onView(withText("Picker")).check(matches(isDisplayed()));
    }
}
