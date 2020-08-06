import React, { useEffect, useState } from 'react';
import { connect } from 'react-redux';
import {apiCollections } from '../services/utilities/API';
import { useForm, Controller } from 'react-hook-form';
import { Form, Input, Button, message, Typography } from 'antd';
import { Redirect } from 'react-router-dom';
import axios from 'axios';
const key = 'updatable';

// Use this component to do the necessary backend tasks after user sets up 
// account -- like set up default collections etc.

function EmailConfirm(props) {

    const {Title} = Typography

    const [verified , setVerified] = useState(false);

    const { handleSubmit, errors, reset, control, defaultValues } = useForm({
        defaultValues: {
            "verification_code": '',
        },
    });

    useEffect(() => {
        const createDefaultCollections = async () => {
            if(props.user_id !== null) {
                apiCollections.post({
                    collection_type : "Main",
                    is_private      : false,
                    description     : 'This is your Main Collection',
                    collection_name : 'Main Collection',
                    owner           : props.user_id,
                }).catch(err => {
                    console.log(err);
                });
                apiCollections.post({
                    collection_type : "Finished",
                    is_private      : false,
                    description     : 'This is your Finished Collection',
                    collection_name : 'Finished Collection',
                    owner           : props.user_id,
                }).catch(err => {
                    console.log(err);
                });
            }
        }
        createDefaultCollections();
    } , [props.user_id])


    const onSubmit = (data) => {
        axios.post('https://127.0.0.1:8000/api/auth/profiles' , {
            user: props.user_id,
            verification_code: data.verification_code
        }).then(res => {
            triggerVerificationSuccess();
        }).catch(err => {
            triggerVerificationError();
        })
    }

    const triggerVerificationSuccess = () => {
        message.loading({ content: 'Verifiying...', key });
            setTimeout(() => {
                message.success({ content: 'Account verified! You\'re good to go', key, duration: 5 });
                setVerified(true);
            }, 3000);
    };

    const triggerVerificationError = () => {
        message.loading({ content: 'Verifiying...', key });
            setTimeout(() => {
                message.error({ content: 'Oops! Looks like you\'ve provided us an invalid confirmation key. Please check your email!', key, duration: 6 });
            }, 3000);
    };

    return (
        <div style={{ paddingTop: 20 }}>
            <Title 
                level={3} 
                style={{  
                    position: 'relative',
                    fontSize: 24, 
                    textAlign : "center", 
                    fontFamily:"Book Antiqua,Georgia,Times New Roman,serif",
                    paddingTop: 10,
                    paddingBottom: 10, 
                    borderRadius: 15,
                    left: 350,
                    color: 'white',
                    background: 'black',
                    width: 1200
                }}>Confirmation Email Sent! Check your email and enter the verification code below to activate your account.
            </Title>
            <form
                style={{ background: `linear-gradient(#CB356B, #BD3F32)`, borderRadius: 10, padding: 24, border: '2px solid black', width: 500, position: 'relative', top: 20, left: 650 }}
                onSubmit={handleSubmit(onSubmit)}>
                <Controller
                    name="verification_code"
                    control={control}
                    rules={{ required: "Please enter a valid verification code" }}
                    as={
                        <Form.Item
                            label="Verification Code"
                            validateStatus={errors.verification_code && "error"}
                            help={errors.verification_code && errors.verification_code.message}
                        >
                            <Input />
                        </Form.Item>
                    }
                    style={{
                        paddingLeft: 20,
                        paddingRight: 20
                    }}
                />
                <Button style={{ left: 50, marginTop: 10, marginBottom: 100 }} type="primary" htmlType="submit">Submit</Button>
                {verified ? <Redirect to="/" /> : null}
            </form>
        </div>
    )
}

const mapStateToProps = (state) => {
    return {
        user_id: state.user_id,
    }
}

export default connect(mapStateToProps)(EmailConfirm);

