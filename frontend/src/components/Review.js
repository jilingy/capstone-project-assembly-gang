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
            "reviewRating": 0,
        },
    });

    const handleOk = (data) => {
        console.log(data);
        apiReviews.post({
            user: props.user_id,
            book: props.book.id,
            review: data.reviewText,
            rating: data.reviewRating,
        }).then(res => {
            props.updateLoading(!props.loading);
            setTimeout(() => {
                props.updateLoading(props.loading);
                props.updateVisible(!props.visible);
            }, 3000);
        }).catch(err => {
            console.log(err)
        })
        //console.log(props.book);
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
            onCancel={handleCancel}          
           
            footer={[
                <Button key="back" onClick={handleCancel}>
                    Cancel
                </Button>,
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
                        
                        <Form.Item  
                            label="Review" 
                            validateStatus={errors.reviewText && "error"}
                            help={errors.reviewText && errors.reviewText.message}
                        >
                            <Input name="reviewText" style={{height : 250}} />
                        </Form.Item>
                        
                    }  
                />

                <Controller
                    name="reviewRating"
                    control={control}
                    type= "number"
                    rules={{ required: "Please enter a rating" }}
                    as={
                        <Rate name="reviewRating">
                            onChange={handleChange} 
                            value={value}    
                        </Rate>
                    }  
                />   
                 <Button type="primary" htmlType="submit" loading={props.loading} onClick={handleOk}>Submit</Button>
            </form>    

        </Modal>
    )
}

const mapStateToProps = state => {
    return {
        user_id: state.user_id,
    }
}


export default connect(mapStateToProps)(Review);