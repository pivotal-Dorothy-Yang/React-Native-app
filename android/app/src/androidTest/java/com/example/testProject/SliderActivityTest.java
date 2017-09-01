package com.example.testProject;

import android.os.SystemClock;
import android.support.test.espresso.PerformException;
import android.support.test.espresso.UiController;
import android.support.test.espresso.ViewAction;
import android.support.test.espresso.action.CoordinatesProvider;
import android.support.test.espresso.action.GeneralSwipeAction;
import android.support.test.espresso.action.Press;
import android.support.test.espresso.action.Swipe;
import android.support.test.espresso.action.Swiper;
import android.support.test.espresso.matcher.ViewMatchers;
import android.support.test.espresso.util.HumanReadables;
import android.support.test.rule.ActivityTestRule;
import android.view.View;
import android.widget.SeekBar;
import android.widget.TextView;

import com.facebook.react.views.slider.ReactSlider;
import com.testproject.MainActivity;

import org.hamcrest.Matcher;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;

import static android.support.test.espresso.Espresso.onView;
import static android.support.test.espresso.action.ViewActions.actionWithAssertions;
import static android.support.test.espresso.action.ViewActions.click;
import static android.support.test.espresso.action.ViewActions.scrollTo;
import static android.support.test.espresso.action.ViewActions.swipeLeft;
import static android.support.test.espresso.action.ViewActions.swipeRight;
import static android.support.test.espresso.assertion.ViewAssertions.matches;
import static android.support.test.espresso.matcher.ViewMatchers.isChecked;
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
public class SliderActivityTest {
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
    }



    //uses a swipe-action to perform an actual swipe of the SeekBar
    //makes sure the callback method (SeekBar.OnSeekBarChangeListener.onProgressChanged) is called
    //with fromUser set to true. It is also more in the line of click testing
    public static ViewAction scrubSeekBarAction(int progress) {
        return actionWithAssertions(new GeneralSwipeAction(
                Swipe.SLOW,
                new SeekBarThumbCoordinatesProvider(0),
                new SeekBarThumbCoordinatesProvider(progress),
                Press.PINPOINT));
    }

    private static class SeekBarThumbCoordinatesProvider implements CoordinatesProvider {
        int mProgress;

        public SeekBarThumbCoordinatesProvider(int progress) {
            mProgress = progress;
        }

        private static float[] getVisibleLeftTop(View view) {
            final int[] xy = new int[2]; //declares and instantiates an int array of 2
            view.getLocationOnScreen(xy); //computes the coordinates of this view on the screen and returns the array with the x and y location
            return new float[]{ (float) xy[0], (float) xy[1] }; //returns the values at index 0 and 1 which store the x and y coordinates respectively of the view
        }

        @Override
        public float[] calculateCoordinates(View view) {
            //error message if SeekBar is not found
            if (!(view instanceof SeekBar)) {
                throw new PerformException.Builder()
                        .withViewDescription(HumanReadables.describe(view))
                        .withCause(new RuntimeException(String.format("SeekBar expected"))).build();
            }
            SeekBar seekBar = (SeekBar) view;
            int barWidth = seekBar.getWidth() - seekBar.getPaddingLeft() - seekBar.getPaddingRight(); //gives you the width of the seekBar, by taking the width of the view and subtracting the padding
            double progress = mProgress == 0 ? seekBar.getProgress() : mProgress; //seekBar.getProgress() returns the seekbar's value
            int xPosition = (int) (seekBar.getPaddingLeft() + (barWidth * progress / seekBar.getMax())); //getPaddingLeft() returns the left padding in pixels
            float[] xy = getVisibleLeftTop(seekBar);
            return new float[]{ xy[0] + xPosition, xy[1] + 10};
        }
    }



//    SeekBar seekBar = (SeekBar) view;
//    int barWidth = seekBar.getWidth() - seekBar.getPaddingLeft() - seekBar.getPaddingRight(); //gives you the width of the seekBar, by taking the width of the view and subtracting the padding
//    double progress = mProgress == 0 ? seekBar.getProgress() : mProgress; //seekBar.getProgress() returns the seekbar's value
//    int xPosition = (int) (seekBar.getPaddingLeft() + barWidth * progress / seekBar.getMax()); //getPaddingLeft() returns the left padding in pixels
//    float[] xy = getVisibleLeftTop(seekBar);
//    return new float[]{ xy[0] + xPosition, xy[1] + 10};
//    //seekBar.getPaddingLeft() + width * progress / seekBar.getMax()






    @Test
    public void allUiElementsAreVisible() {
        onView(withText("Slider")).check(matches(isDisplayed()));
        onView(allOf(withClassName(endsWith("ImageView")), isDescendantOfA(withContentDescription("Switch"))))
                .check(matches(isDisplayed()));
        onView(withClassName(endsWith("Slider"))).check(matches(isDisplayed()));
        onView(withText("Number: 0")).check(matches(isDisplayed()));
        onView(withContentDescription("an_Slider_Next")).check(matches(isDisplayed()));

    }

    @Test
    public void changeSliderToValueGreaterThanZeroAndLessThan100() {
        onView(withClassName(endsWith("Slider"))).perform(scrubSeekBarAction(160)); //sets seekbar to 50, every increase by 10 is an  increase by 8 on the slider
        onView(withText("Number: 50")).check(matches(isDisplayed()));
    }

    @Test
    public void changeSliderToValue100() {
        onView(withClassName(endsWith("Slider"))).perform(scrubSeekBarAction(220)); //sets seekbar to 100
        onView(withText("Number: 100")).check(matches(isDisplayed()));
        SystemClock.sleep(3000);


    }

    @Test
    public void changSliderToValueLessThanZeroAndGreaterThanNegative100() {
        onView(withClassName(endsWith("Slider"))).perform(scrubSeekBarAction(41)); //sets seekbar to -50
        onView(withText("Number: -50")).check(matches(isDisplayed()));
    }

    @Test
    public void changeSliderToValueNegative100() {
        onView(withClassName(endsWith("Slider"))).perform(scrubSeekBarAction(-20)); //sets seekbar to -100
        onView(withText("Number: -100")).check(matches(isDisplayed()));
    }

    @Test
    public void onPressNextAndBackScrollingScreenAndSliderScreenLoad() {
        onView(withContentDescription("an_Slider_Next"))
                .perform(click());
        onView(withText("Scrolling")).check(matches(isDisplayed()));
        onView(allOf(withClassName(endsWith("ImageView")), isDescendantOfA(withContentDescription("Slider")))).perform(click());
        onView(withText("Slider")).check(matches(isDisplayed()));
    }



}


//    public static ViewAction setProgress(final int progress) {
//        return new ViewAction() {
//            @Override
//            public void perform(UiController uiController, View view) {
//                SeekBar seekBar = (SeekBar) view;
//                seekBar.setProgress(progress);
//            }
//            @Override
//            public String getDescription() {
//                return "Set a progress on a SeekBar";
//            }
//            @Override
//            public Matcher<View> getConstraints() {
//                return ViewMatchers.isAssignableFrom(SeekBar.class);
//            }
//        };
//    }

//    public static ViewAction setProgress(final int progress) {
//        return new ViewAction() {
//            @Override
//            public Matcher<View> getConstraints() {
//                return ViewMatchers.isAssignableFrom(SeekBar.class);
//            }
//
//            @Override
//            public String getDescription() {
//                return "Set a progress value";
//            }
//
//            @Override
//            public void perform(UiController uiController, View view) {
//                final SeekBar mySeekBar = (SeekBar) view;
//                mySeekBar.setProgress(progress);
//                mySeekBar.refreshDrawableState();
//
//                mySeekBar.setMax(200);
//            }
//        };
//    }
//
//    public static ViewAction updateText(final int val) {
//        return new ViewAction() {
//            @Override
//            public Matcher<View> getConstraints() {
//                return ViewMatchers.isAssignableFrom(TextView.class);
//            }
//
//            @Override
//            public String getDescription() {
//                return "Update the text value to match the slider value";
//            }
//
//            @Override
//            public void perform(UiController uiController, View view) {
//                final TextView myText = (TextView) view;
//                myText.setText("Number: " + val);
//
//            }
//        };
//    }
