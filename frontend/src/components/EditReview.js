import React, { useEffect, useState } from 'react';
import { Button, Modal, Form, Input, Rate, message} from 'antd';
import BookCover from '../images/book_cover.jpg';
import { useForm, Controller } from 'react-hook-form';
import { connect } from 'react-redux';
import { apiBooks, apiReviews } from '../services/utilities/API';
import TextArea from 'antd/lib/input/TextArea';

const key = 'updatable';

function Review(props) {

    


    const { handleSubmit, errors, reset, control, defaultValues } = useForm({
        defaultValues: {
            "reviewText": '',
            "reviewRating": 0,
        },
    });

   


    const editReviewSuccess = () => {
        message.loading({ content: 'Processing...', key });
            setTimeout(() => {
                message.success({ content: 'Review edited successfully!', key, duration: 2 });
            }, 1000);
    };

    const deleteReviewSuccess = () => {
        message.loading({ content: 'Processing...', key });
            setTimeout(() => {
                message.success({ content: 'Review deleted successfully!', key, duration: 2 });
            }, 1000);
    };

   

    const handleOk = (data) => {
        //console.log(data, props.review.id);
        apiReviews.patch(props.review.id,{
            review: data.reviewText,
            rating: data.reviewRating,
        }).then(res => {
            props.updateLoading(!props.loading);
            editReviewSuccess();
            setTimeout(() => {
                props.updateLoading(props.loading);
                props.updateEditVisible(!props.visible);
               
            }, 1000);
            
        }).catch(err => {
            console.log(err)
        })
        //console.log(props.book);
    };
    
    const handleCancel = () => {
        props.updateEditVisible(!props.visible);
        
    };

    const handleDelete = () => {
            apiReviews.remove(props.review.id
                ).then(res => {
                props.updateLoading(!props.loading);
                deleteReviewSuccess();
                setTimeout(() => {
                    props.updateLoading(props.loading);
                    props.updateEditVisible(!props.visible);
                    
                }, 1000);
                
            }).catch(err => {
                console.log(err)
            })
            //console.log(props.book);
    
        
    };

    let text;
    if(props.review !== undefined){
        text = <div> Your previous rating was : {props.review.rating}</div>
    }


    const { TextArea } = Input;

    return (
        <Modal
            title= {props.book.book_title}
            visible={props.visible}
            destroyOnClose={true}
            onCancel={handleCancel}          
            
            footer={[
                <Button key="back" onClick={handleCancel} style={{right: 100, position: 'relative'}}>
                    Cancel
                </Button>,
            ]}
        >

            <b><label>Book Synopsis</label></b>
            <p>{props.book.book_synopsis}</p>

            <form
            className="reviewForm"
            onSubmit={handleSubmit(handleOk)}>
                <Controller
                    name="reviewText"
                    control={control}
                    rules={{ required: "Please enter a review" }}
                    as={
                        <div>
                            <b><label>Review</label></b>
                            <p>
                            <TextArea rows={8} name="reviewText" defaultValue={(props.review === undefined) ? "" : props.review.review}> 
                           
                            </TextArea>
                            </p>
                        </div>
                    }  
                />
                <b><label>Rating</label></b>
                <br></br>
                <Controller
                    name="reviewRating"
                    control={control}
                   
                    type= "number"
                    rules={{ required: "Please enter a rating" }}
                    as={
                        <Rate name="reviewRating" >
                            
                        </Rate>
                    }  
                />   
                
                {text}
                               
                 <Button type="primary" htmlType="submit" loading={props.loading} onClick={handleOk} style={{left: 390, top: 67, position: 'relative'}}>Submit</Button>
                    
                 <Button type= "primary" onClick={handleDelete} style={{left: 280, bottom: 450, position: 'relative'}} >Delete</Button>
 
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