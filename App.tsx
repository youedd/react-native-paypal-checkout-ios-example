/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 */

import React from 'react';
import { Button, View, NativeModules } from 'react-native';



function App(): JSX.Element {

  return (
    <View style={{
      flex: 1,
      justifyContent: "center"
    }} >
      <Button
        title='Start'
        onPress={() => {
          const module: { start: () => void } = NativeModules.RNPaypalCheckout;
          module.start()
        }}
      />
    </View>
  );
}

export default App;
