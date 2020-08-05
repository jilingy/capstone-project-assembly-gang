import React from 'react';
import { GoogleLogin } from 'react-google-login';
import { Button, message } from "antd";
import { GoogleOutlined } from '@ant-design/icons';
import { connect } from 'react-redux';
import * as actions from '../store/actions/auth';
import axios from 'axios';
 
const key = 'updatable';

function GoogleAuth (props) {

    const responseGoogle = async (response) => {
        props.onAuth(response.accessToken, response.tokenId)
        signInSuccess();
    }
	   
	const signInSuccess = () => {
        message.loading({ content: 'Processing...', key });
        setTimeout(() => {
            message.success({ content: 'Welcome to ReadRecommend!', key, duration: 2 });
        }, 1000);
    };

	return (
		<GoogleLogin
            clientId="348019820347-dk1i5j2buchlrhs0vb1if5p2dgm3j0j3.apps.googleusercontent.com"
            render={renderProps => (
				<Button onClick={renderProps.onClick} icon={<GoogleOutlined style={{verticalAlign: 'middle' }}/>} style={{ color: 'white', background: 'red' }}>Login with Google</Button>
            )}
            buttonText="Login"
            onSuccess={responseGoogle}
			onFailure={responseGoogle}
            cookiePolicy={'single_host_origin'}
            autoLoad={false}
        />
	)
}

const mapStateToProps = (state) => {
	return {
	  error: state.error,
	  user_id: state.user_id,
	}
}
  
const mapDispatchToProps = (dispatch) => {
	return {
		onAuth: (access_token, token_ID) => dispatch(actions.authGoogleLogin(access_token, token_ID))
	}
}
  
export default connect(mapStateToProps, mapDispatchToProps)(GoogleAuth);