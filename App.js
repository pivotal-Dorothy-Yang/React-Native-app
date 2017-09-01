import React, {Component, PropTypes} from 'react';
import {Text, View, Button, StyleSheet, TextInput, Platform, Image, Alert, ScrollView, FlatList, ListView, SectionList, Picker, Switch, Slider} from 'react-native';
import { StackNavigator} from 'react-navigation';

class InputTextScreen extends Component {
  static navigationOptions = {
    title: 'Text Input',
  };
  render() {
    //here using the const {navigate} is the same as saying: const navigate = this.props.navigation.navigate (deconstructing element and assigning to variable), avoids repetition
    const { navigate } = this.props.navigation;
    const {state} = this.props.navigation;
    const {setParams} = this.props.navigation;
    return (
      <View style = {styles.container}>
        <View style = {styles.Input}>
          <TextInput style = {styles.addTextInput}
            accessibilityLabel = "an_input_1_id"
            value = {state.text}
            testID = "input_1_id"
            onChangeText = {text => setParams({text})}
            maxLength = {(Platform.OS === 'ios') ? 35 : 45}
            placeholder = 'Type your text here!'
            //when typing in text in iOS, the clear text button is visible only when editing  
            clearButtonMode = {(Platform.OS === 'ios') ? 'while-editing' : 'never'}/>
        </View>

        <View style = {[styles.Input, {flexDirection: 'row'}]}>
          <TextInput style = {[styles.addTextInput, {flex: 1}]}
            maxLength = {(Platform.OS === 'ios') ? 10 : 10}
            accessibilityLabel = "an_input_2_id"
            testID = "input_2_id"
            value = {state.text}
            onChangeText = {text => setParams({text})}
            placeholder = 'col 1' />
          <TextInput style = {[styles.addTextInput, {flex: 2}]}
            maxLength = {(Platform.OS === 'ios') ? 20 : 25}
            accessibilityLabel = "an_input_3_id"
            testID = "input_3_id"
            value = {state.text}
            onChangeText = {text => setParams({text})}
            placeholder = 'col 2' />
        </View>
        <View style = {styles.nextButton}>
          <Button
            onPress={() => navigate('Buttons')}
            title="Next"
            accessibilityLabel = "an_Text_Input_Next"
            testID="Text_Input_Next" />
        </View>
      </View>

    );
  }
}

class ButtonScreen extends Component {
  static navigationOptions = {
    title: 'Buttons',
  };

  render() {
    const { navigate } = this.props.navigation;
    return (
      <View>
        <View style = {styles.horizontalButtonContainer}>
          <Button 
            accessibilityLabel='an_button_1_id'
            testID = 'button_1_id'
            title = 'button 1'
            onPress = {() => {Alert.alert('You pressed button 1!')}} />
          <Button 
          //differently positioned buttons with different texts which trigger different alerts
            accessibilityLabel='an_button_2_id'
            testID = 'button_2_id'
            title = 'button 2'
            color = 'red'
            onPress = {() => {Alert.alert('You pressed button 2!')}} />
          <Button 
            accessibilityLabel='an_button_3_id'
            testID = 'button_3_id'
            title = 'button 3'
            color = 'purple'
            onPress = {() => {Alert.alert('You pressed button 3!')}} />
        </View>
        <View style = {styles.buttonNextToImage}>
          <View style = {styles.verticalButtonContainer}>
            <Button 
              accessibilityLabel='an_button_4_id'
              testID = 'button_4_id'
              title = 'button 4'
              onPress = {() => {Alert.alert('You pressed button 4!')}} />
            <Button 
              accessibilityLabel='an_button_5_id'
              testID = 'button_5_id'
              title = 'button 5'
              color = 'red'
              onPress = {() => {Alert.alert('You pressed button 5!')}} />
            <Button 
              accessibilityLabel='an_button_6_id'
              testID = 'button_6_id'
              title = 'button 6'
              color = 'purple'
              onPress = {() => {Alert.alert('You pressed button 6!')}} />
          </View>
          <Image
            accessibilityLabel="butterfly"
            accessible= {true}
            style = {{width: 200, height: 200}}
            source = {{uri: 'https://homepages.cae.wisc.edu/~ece533/images/monarch.png'}} />
        </View>
        <View style = {styles.nextButton}>
          <Button
            onPress={() => navigate('Flat')}
            title="Next"
            accessibilityLabel="an_Buttons_Next" 
            testID="Buttons_Next"/>
        </View>
      </View>
    );
  }
}

class ScrollViewScreen extends Component {
  static navigationOptions = {
    title: 'Scrolling',
  };

  render() {
    const { navigate } = this.props.navigation;
    return (
      <ScrollView testID="LONGSCROLL">
        <View style = {styles.scrollContainer}>
          <View>
            <Text style = {styles.scrollText} testID = 'row_1_id' accessibilityLabel = 'an_row_1_id'>Row 1</Text>
          </View>
          <Text style = {styles.scrollText} testID = 'row_2_id' accessibilityLabel = 'an_row_2_id'>Row 2</Text>
          <Image
            accessibilityLabel="an_img_1"
            testID="img_1"
            style = {{width: 150, height: 150}} 
            source = {{uri: 'https://homepages.cae.wisc.edu/~ece533/images/monarch.png'}} />
            <Text style = {styles.scrollText} testID = 'row_3_id' accessibilityLabel = 'an_row_3_id'>Row 3</Text>
            <Text style = {styles.scrollText} testID = 'row_4_id' accessibilityLabel = 'an_row_4_id'>Row 4</Text>
            <Text style = {styles.scrollText} testID = 'row_5_id' accessibilityLabel = 'an_row_5_id'>Row 5</Text>
            <Text style = {styles.scrollText} testID = 'row_6_id' accessibilityLabel = 'an_row_6_id'>Row 6</Text>
          <Image
            accessibilityLabel="an_img_2"
            testID="img_2"
            style = {{width: 250, height: 100, marginBottom: 30}} 
            source = {{uri: 'https://homepages.cae.wisc.edu/~ece533/images/monarch.png'}} />
          <Image
            accessibilityLabel="an_img_3"
            testID="img_3"
            style = {{width: 300, height: 200}} 
            source = {{uri: 'https://homepages.cae.wisc.edu/~ece533/images/monarch.png'}} />
          <Text style = {styles.scrollText} testID = 'row_7_id' accessibilityLabel = 'an_row_7_id'>Row 7</Text>
          <Text style = {styles.scrollText} testID = 'row_8_id' accessibilityLabel = 'an_row_8_id'>Row 8</Text>
        </View>
                

        <View style = {styles.horizontalButtonContainer}>
          <Image 
            accessibilityLabel="an_img_4"
            testID='img_4'
            style = {{width: 150, height: 100}} 
            source = {{uri: 'https://homepages.cae.wisc.edu/~ece533/images/monarch.png'}} />
          <Image 
            accessibilityLabel="an_img_5"
            testID='img_5'
            style = {{width: 150, height: 100}} 
            source = {{uri: 'https://homepages.cae.wisc.edu/~ece533/images/monarch.png'}} />
        </View>

        <View style = {styles.scrollContainer}>
          <Text style = {styles.scrollText} testID = 'row_9_id' accessibilityLabel = 'an_row_9_id'>Row 9</Text>
          <Text style = {styles.scrollText} testID = 'row_10_id' accessibilityLabel = 'an_row_10_id'>Row 10</Text>
          <Text style = {styles.scrollText} testID = 'row_11_id' accessibilityLabel = 'an_row_11_id'>Row 11</Text>
          <Text style = {styles.scrollText} testID = 'row_12_id' accessibilityLabel = 'an_row_12_id'>Row 12</Text>
          <Text style = {styles.scrollText} testID = 'row_13_id' accessibilityLabel = 'an_row_13_id'>Row 13</Text>
          <Text style = {styles.scrollText} testID = 'row_14_id' accessibilityLabel = 'an_row_14_id'>Row 14</Text>
          <Text style = {styles.scrollText} testID = 'row_15_id' accessibilityLabel = 'an_row_15_id'>Row 15</Text>
        </View>
      </ScrollView>
        // <View style = {styles.nextButton}>
        //   <Button
        //     onPress={() => navigate('Flat')}
        //     title="Next"
        //     testID="Scrolling_Next" />
        //</View>
      
    );
  }
}


class FlatListScreen extends Component {
  static navigationOptions = {
    title: 'Flat List',
  };
  
  renderFooter() {
    return(
      <View style = {styles.nextButton}>
        <Button
          onPress={() => navigate('Section')}
          title="Next" />
      </View>
    );
  };

  render() {
    return(
      <View>
        <FlatList
          data={[
            {key: 'Item 1'},
            {key: 'Item 2'},
            {key: 'Item 3'},
            {key: 'Item 4'},
            {key: 'Item 5'},
            {key: 'Item 6'},
            {key: 'Item 7'},
            {key: 'Item 8'},
            {key: 'Item 9'},
            {key: 'Item 10'},
            {key: 'Item 11'},
            {key: 'Item 12'},
          ]}
          renderItem={({item}) => <Text style={styles.flatText} accessibilityLabel={`flat ${item.key}`} testID = {`flat ${item.key}`}>{item.key}</Text>} 
          ListFooterComponent={
            <View style = {styles.nextButton}>
              <Button
                onPress={() => this.props.navigation.navigate('Section')}
                title="Next"
                accessibilityLabel="an_Flat_List_Next"
                testID="Flat_List_Next" />
            </View>
          } /> 
      </View>
    );
  }
}

/*for Next button in Flat List screen need to use ListFooterComponent to make the button appear, or else if you just use button by itself it won't be rendered*/

class SectionListScreen extends Component {
  static navigationOptions = {
    title: 'Section List',
  };

  render() {
    return (
      <View testID="SCROLL">
        <SectionList
          sections={[
            {title: 'D', 
              data: ['Data 1', 'Data 2', 'Data 3', 'Data 4']},
            {title: 'I', 
              data: ['Item 1', 'Item 2', 'Item 3', 'Item 4', 'Item 5']},
            {title: 'T', 
              data: ['Task 1', 'Task 2', 'Task 3']},
          ]}
          keyExtractor={(item, index) => index}
          renderItem={({item}) => <Text style={styles.sectionText} testID={`section ${item}`} accessibilityLabel={`section ${item}`}>{item}</Text>}
          renderSectionHeader={({section}) => <Text style={styles.sectionHeader} testID={`section ${section.title}`}>{section.title}</Text>}
          
          ListFooterComponent={
            <View style = {styles.nextButton}>
              <Button
                onPress={() => this.props.navigation.navigate('Picker')}
                title="Next"
                accessibilityLabel="an_Section_List_Next"
                testID="Section_List_Next" />
            </View>
          } /> 
      </View>
    );
  }
}

class PickerScreen extends Component {
  constructor(props) {
    super(props);
    data=['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
    this.state = {
      day: 'Monday',
    }
  }

  static navigationOptions = {
    title: 'Picker',
  };

  renderItems() {
    items=[];
    for (var day of data) {
      items.push(<Picker.Item key={day} label={day} value={day}/>)
    }
    return items;
  }

  render() {
    return(
      <View>
        <Text style={[styles.sectionHeader, {backgroundColor: 'transparent'}]}>Days of the Week</Text>
        <Picker
          accessible = {true}
          selectedValue={this.state.day}
          onValueChange={(day) => this.setState({day: day})}>
          {this.renderItems()}
        </Picker>
        <Text style={{fontSize: 20}}>You picked: {this.state.day}</Text>
        <Button
          onPress={() => this.props.navigation.navigate('Switch')}
          title="Next" 
          accessibilityLabel="an_Picker_Next"
          testID="Picker_Next" />
      </View>
    );
  }
}

class SwitchScreen extends Component {
  constructor(props) {
    super(props);
    this.state = {
      trueSwitchIsOn: true,
      falseSwitchIsOn: false,
    }
  }

  static navigationOptions = {
    title: 'Switch',
  };

  render() {
    return (
      <View>
        <View style={{flexDirection: 'row', justifyContent: 'space-around'}}>
          <View>
            <Switch
              accessibilityLabel="an_defaultOFF_id"
              testID="defaultOFF_id"
              onValueChange={(value) => {this.setState({falseSwitchIsOn: value})}}
              style={{margin: 10}}
              value={this.state.falseSwitchIsOn} />
            <Text testID="left_switch_id" accessibilityLabel="an_left_switch_id">{this.state.falseSwitchIsOn ? 'ON' : 'OFF'}</Text>
          </View>
          <View>
            <Switch
              accessibilityLabel="an_defaultON_id"
              testID="defaultON_id"
              onValueChange={(value) => this.setState({trueSwitchIsOn: value})}
              style={{margin: 10}}
              value={this.state.trueSwitchIsOn} />
            <Text testID="right_switch_id" accessibilityLabel="an_right_switch_id">{this.state.trueSwitchIsOn ? 'ON' : 'OFF'}</Text>
          </View>
        </View>
        <Button
            onPress={() => this.props.navigation.navigate('Slider')}
            title="Next" 
            accessibilityLabel="an_Switch_Next"
            testID="Switch_Next"/>
      </View>
    );
  }
}

class SliderScreen extends Component {
  constructor(props) {
    super(props);
    this.state = {value: 0}
  } 

  static navigationOptions = {
    title: 'Slider',
  };

  render() {
    return(
      <View style={styles.sliderContainer}>
        <Slider
          style={{width: 300}}
          step={1}
          minimumValue={-100}
          maximumValue={100}
          value={this.state.value}
          onValueChange={val => this.setState({value: val})}
          onSlidingComplete={val => this.setState({value: val})} />
        <Text style={{fontSize: 20}} accessibilityLabel="an_number">Number: {this.state.value}</Text>
        <View style={styles.nextButton}>
          <Button
              onPress={() => this.props.navigation.navigate('Scroll')}
              title="Next" 
              accessibilityLabel="an_Slider_Next"
              testID="Slider_Next"/>
        </View>
      </View>
    );
  }
}



const SimpleApp = StackNavigator({
  InputText: {screen: InputTextScreen},
  Buttons: {screen: ButtonScreen},
  Flat: {screen: FlatListScreen},
  Section: {screen: SectionListScreen},
  Picker: {screen: PickerScreen},
  Switch: {screen: SwitchScreen},
  Slider: {screen: SliderScreen},
  Scroll: {screen: ScrollViewScreen},
});

export default class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = {};
  }

  render() {
    return (
      <View style = {styles.container}>
        <SimpleApp />
      </View>
    );
  }
}







const styles = StyleSheet.create({
  container: {
    flex: 1,
  },
  nextButton: {
    margin: 10,
    justifyContent: 'flex-end',
  },
  Input: {
    borderColor: 'springgreen',
    borderWidth: 1,
  },
  addTextInput: {
    height: 45,
    backgroundColor: '#edf0f4', //light grey
    padding: 10,
    margin: 10,
  },
  TextInputRow: {
    flexDirection: 'row',
    flex: 1,
    height: 45,
  },
  horizontalButtonContainer: {
    padding: 5,
    flexDirection: 'row',
    borderColor: 'orange',
    justifyContent: 'space-around',
    borderWidth: 2,
  },
  verticalButtonContainer: {
    padding: 5,
    flexDirection: 'column',
    borderColor: 'green',
    justifyContent: 'space-between',
    borderWidth: 2,
    maxWidth: 100,
  },
  buttonNextToImage: {
    flexDirection: 'row',
    justifyContent: 'space-around',
    borderColor: 'red',
    borderWidth: 2,
  },
  scrollContainer: {
    alignItems: 'center',
  },
  scrollText: {
    fontSize: 40,
    padding: 40,
  },
  flatText: {
    fontSize: 30,
    margin: 5,
  },
  sectionText: {
    fontSize: 20,
    margin: 10,
  },
  sectionHeader: {
    fontSize: 20,
    fontWeight: 'bold',
    backgroundColor: 'lightsalmon',
    paddingLeft: 5,
  },
  sliderContainer: {
    flex: 1,
    alignItems: 'center',
  },
});

