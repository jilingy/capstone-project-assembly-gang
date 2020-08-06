import React, { useState } from 'react'
import { Form, Input, Button,Typography} from 'antd'
import { Link, Redirect } from 'react-router-dom';
import { connect } from 'react-redux';
import * as actions from '../store/actions/auth';
import Fade from 'react-reveal/Fade';

function Register(props) {

    const {Title} = Typography

    const [toLogin, setToLogin] = useState(false);

    const layout = {
        labelCol: {
          span: 10,
        },
        wrapperCol: {
          span: 4,
        },
      };
    const tailLayout = {
        wrapperCol: {
          offset: 5,
          span: 17,
        },
      };

    const onSubmit = values => {
      props.onAuth(
        values.username, 
        values.email, 
        values.firstname, 
        values.lastname, 
        values.password
      );
      setToLogin(true);
    };
    
    const onSubmitFailed = errorInfo => {
      console.log('Failed:', errorInfo);
    };

    return(
    <div>
    {toLogin ? <Redirect to="/emailconfirm" /> : null}
    <Title 
      level={3} 
      style={{
        paddingTop: 100, 
        color: 'white', 
        fontSize: 100, 
        textAlign : "center", 
        fontFamily:"Book Antiqua,Georgia,Times New Roman,serif" 
      }}>ReadRecommend</Title>
    <Fade left cascade>
      <p style={{ 
        bottom: 60, 
        position: 'relative', 
        textAlign : "center", 
        fontSize: 25, 
        color: 'white' 
      }}>More than just a book haven...</p>
    </Fade>
    <Title 
      level={3} 
      style={{ 
        color: 'white', 
        fontSize: 30, 
        textAlign : "center", 
        fontFamily:"Book Antiqua,Georgia,Times New Roman,serif" 
      }}>      Account Registration</Title>
    <Form
      {...layout}
      name="basic"
      initialValues={{
        remember: true,
      }}
      onFinish={onSubmit}
      onFinishFailed={onSubmitFailed}
    >   

      <Form.Item
        label="First Name"
        name="firstname"
        rules={[
          {
            required: true,
            message: 'Please input your first name!',
          },
        ]}
      >
        <Input />
      </Form.Item>

      <Form.Item
        label="Last Name"
        name="lastname"
        rules={[
          {
            required: true,
            message: 'Please input your last name!',
          },
        ]}
      >
        <Input />
      </Form.Item>

      <Form.Item
        label="Username"
        name="username"
        rules={[
          {
            required: true,
            message: 'Please input your username!',
          },
        ]}
      >
        <Input />
      </Form.Item>

      <Form.Item
        label="Email"
        name="email"
        rules={[
          {
            required: true,
            message: 'Please input your email!',
          },
        ]}
      >
        <Input />
      </Form.Item>

      <Form.Item
        label="Password"
        name="password"
        rules={[
          {
            required: true,
            message: 'Please input your password!',
          },
          {
            min: 8,
            message: 'Password must be at least 8 characters long!'
          }
        ]}
      >
        <Input.Password />
      </Form.Item>

      <Form.Item {...tailLayout}>
        <Button type="primary" htmlType="submit" style={{ right: 120 }}>
          Register
        </Button>
      </Form.Item>
    </Form>
    <Link to="/">Return to Login</Link>
    </div>
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
    onAuth: (username, email, first_name, last_name, password) => dispatch(actions.authSignup(username, email, first_name, last_name, password))
  }
}

export default connect(mapStateToProps, mapDispatchToProps)(Register);