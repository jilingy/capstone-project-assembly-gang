import React, { useEffect, useState } from 'react';
import { Button, Modal, Form, Input, Rate} from 'antd';
import BookCover from '../images/book_cover.jpg';
import { useForm, Controller } from 'react-hook-form';
import { connect } from 'react-redux';
import { apiBooks, apiReviews } from '../services/utilities/API';


function Review(props) {

    const [value, setValue] = useState(0);

    const { handleSubmit, errors, reset, control, defaultValues } = useForm({
        defaultValues: {
            "reviewText": '',
            "reviewRating": '',
        },
    });

    const handleOk = (data) => {
        apiReviews.post({
            user: props.user_id,
            book: props.book.id,
            review: data.reviewText,
            rating: data.reviewRating,

        }).catch(err => {
            console.log(err)
        })
        props.updateLoading(!props.loading);
        setTimeout(() => {
            props.updateLoading(props.loading);
            props.updateVisible(!props.visible);
        }, 3000);
        console.log(props.book);
    };
    
    const handleCancel = () => {
        props.updateVisible(!props.visible);
    };

    const handleChange = value => {
        setValue(value)
      };

    

    return (
        <Modal
            title= {props.book.book_title}
            visible={props.visible}
            onOk={handleOk}
            onCancel={handleCancel}          
           
            footer={[
                <Button key="back" onClick={handleCancel}>
                    Cancel
                </Button>,
                <Button
                    key="submit"
                    type="primary"
                    loading={props.loading}
                    onClick={handleOk}
                >
                    Submit
                </Button>
            ]}
                >
            <form
            className="reviewForm"
            onSubmit={handleSubmit(handleOk)}>
                <Controller
                    name="reviewText"
                    control={control}
                    rules={{ required: "Please enter a review" }}
                    as={
                        
                        <Form.Item  label="Review" 
                                    validateStatus={errors.reviewText && "error"}
                                    help={errors.reviewText && errors.reviewText.message}
                        >
                        <Input.TextArea rows={8} />
                        </Form.Item>
                        
                    }  
                />

                <Controller
                    name="reviewRating"
                    control={control}
                    type= "number"
                    rules={{ required: "Please enter a rating" }}
                    as={
                        <Rate>
                        onChange={handleChange} 
                        value={value}    
                        </Rate>
                    }  
                />   
                
            </form>    
                         

            <p>{props.book.book_synopsis}</p>
            <p>USER ID - {props.user_id}</p>
            <p>Some contents...</p>


        </Modal>
    )
}

const mapStateToProps = state => {
    return {
        user_id: state.user_id,
    }
}


export default connect(mapStateToProps)(Review);