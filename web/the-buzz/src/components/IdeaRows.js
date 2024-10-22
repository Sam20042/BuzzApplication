import Idea from './Idea.js';


function IdeaRows(props) {
    const ideas = props.ideas;

    return (
        <div>
            {ideas.map((idea) => (
                <Idea id={idea.mId} likes={idea.mLikes} message={idea.mMessage} />
            ))}
        </div>
    )
}

export default IdeaRows;