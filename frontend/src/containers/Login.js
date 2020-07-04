import React, { useState } from 'react'
import { Form, Input, Button, Checkbox, Typography } from 'antd'
import { Link,Redirect } from 'react-router-dom';
import { connect } from 'react-redux';
import * as actions from '../store/actions/auth';

function Login(props) {
  
   const [toCollection, setToCollection] = useState(false);

    const {Title} = Typography
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
          offset: 7,
          span: 13,
        },
      };
    const headLayout = {
        wrapperCol: {
          offset: 6,
          span: 7,
        },
    };

    const onSubmit = values => {
      props.onAuth(values.username, values.password);
      setToCollection(true);
    };
  
    const onSubmitFailed = errorInfo => {
      console.log('Failed:', errorInfo);
    };

    return(
    <div>
    {toCollection ? <Redirect to="/col_list" /> : null}
    <Title
      level={3}
    >
      Login
    </Title>
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
        label="Password"
        name="password"
        rules={[
          {
            required: true,
            message: 'Please input your password!',
          },
        ]}
      >
        <Input.Password />
      </Form.Item>

      <Form.Item {...headLayout} name="remember" valuePropName="checked">
        <Checkbox>Remember me</Checkbox>
      </Form.Item>

      <Form.Item {...tailLayout}>
        <Button type="primary" htmlType="submit">
          Log In
        </Button>
      </Form.Item>
    </Form>
    <Link to="/register">Register for an Account</Link>
    </div>
    )

}

const mapStateToProps = (state) => {
  return {
    loading : state.loading,
    error   : state.error
  }
}

const mapDispatchToProps = (dispatch) => {
  return {
    onAuth: (username, password) => dispatch(actions.authLogin(username, password))
  }
}

export default connect(mapStateToProps, mapDispatchToProps)(Login);