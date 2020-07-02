import React, { useState } from 'react'
import { Form, Input, Button,Typography} from 'antd'
import { Link, Redirect } from 'react-router-dom';

export default function Register() {

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
        console.log('Success:', values);
        setToLogin(true)
      };
    
    const onSubmitFailed = errorInfo => {
        console.log('Failed:', errorInfo);
      };

    return(
    <div>
    {toLogin ? <Redirect to="/emailconfirm" /> : null}
    <Title
      level={3}
    >
      Account Registration
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

      <Form.Item {...tailLayout}>
        <Button type="primary" htmlType="submit">
          Register
        </Button>
      </Form.Item>
    </Form>
    <Link to="/login">Return to Login</Link>
    </div>
    )

}